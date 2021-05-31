//
//  LoginView.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/04/24.
//

import SwiftUI
import Combine
import KakaoSDKAuth
import KakaoSDKUser
import AuthenticationServices

struct LoginView: View {
    
    // MARK: Constants
    
    // TODO: .localized
    private enum Texts {
        static let kakao: String = "카카오로 로그인" 
    }
    
    private enum Metrics {
        static let buttonWidth: CGFloat = UIScreen.main.bounds.width * 0.8
        static let buttonHeight: CGFloat = 60
        static let cornerRadius: CGFloat = 6
    }
        
    // MARK: Property
    
    @StateObject var viewModel: LoginViewModel
    
    // MARK: Init
    
    init(viewModel: LoginViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            Color(.sRGB, red: 0.094, green: 0.137, blue: 0.306, opacity: 1)
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 58, content:  {
                loginIntroductionTitle
                loginIntroductionDescription
                
                Spacer().frame(height: 38)
                
                loginVStack
            })
        }
    }
}

// MARK: UI Methods

extension LoginView {
    private var loginIntroductionTitle: some View {
        Text("제로웨이스트 습관 형성 앱")
            .foregroundColor(.white)
    }
    
    private var loginIntroductionDescription: some View {
        Text("zero would you?")
            .foregroundColor(.white)
    }
    
    private var loginVStack: some View {
        return VStack(alignment: .center, spacing: 15, content: {
            kakaoLoginButton
            appleLoginButton
        })
    }
    
    private var kakaoLoginButton: some View {
        Button(Texts.kakao, action: kakaoLogin)
            .font(.custom("Apple SD Gothic Neo", size: 16))
            .frame(
                width: Metrics.buttonWidth, 
                height: Metrics.buttonHeight, 
                alignment: .center
            )
            .background(Color(red: 1.0, green: 0.9, blue: 0.0))
            .foregroundColor(.black)
            .cornerRadius(Metrics.cornerRadius)
    }
    
    private var appleLoginButton: some View {
        SignInWithAppleButton(
            .signIn,
            onRequest: configure,
            onCompletion: handle
        )
        .signInWithAppleButtonStyle(.black)
        .frame(
            width: Metrics.buttonWidth, 
            height: Metrics.buttonHeight, 
            alignment: .center
        )
    }
}

extension LoginView {
    private func kakaoLogin() {
        guard UserApi.isKakaoTalkLoginAvailable().isTrue else {
            print("UserApi.isKakaoTalkLoginAvailable is false")
            return
        }
        
        UserApi.shared.loginWithKakaoTalk { oauthToken, error in
            guard error.isNone else { 
                // TODO: 에러 표시로 변경
                print(String(describing: error))
                return
            }
            
            if let oauthToken = oauthToken {
                print(oauthToken)
                
                self.viewModel.apply(.kakaoLogin(token: oauthToken))    
            }
        }
    }
    
    private func configure(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.email, .fullName]
    }
    
    private func handle(_ authResult: Result<ASAuthorization, Error>) {
        switch authResult { 
        case let .success(auth):
            print(auth)
            
            switch auth.credential {
            case let appleIdCredentials as ASAuthorizationAppleIDCredential:
                if let appleUser = AppleUser(credentials: appleIdCredentials) {
                    let appleUserData = try? JSONEncoder().encode(appleUser)
                    
                    // userDefaults에 저장하는건 위험한 방법이지만 지금 저장안하면
                    // 앞으로는 아예 저장 못해서 일단 여기 저장하고 나중에 지우는게 좋다고 함
                    UserDefaults.standard.setValue(appleUserData, forKey: appleUser.userID)
                    
                    print("saved apple user", appleUser)
                    
                    viewModel.apply(.appleLogin(token: appleUser))
                } else {
                    print("missing some fields", appleIdCredentials.user)
                    
                    guard let appleUserData = UserDefaults.standard.data(forKey: appleIdCredentials.user),
                          let appleUser = try? JSONDecoder().decode(AppleUser.self, from: appleUserData)
                    else { return }
                    
                    print(appleUser)
                    
                    viewModel.apply(.appleLogin(token: appleUser))
                }
                
                
            default:
                print(auth)
                // TODO: 여기서도 에러 보내야하는가?
            }
            
        case let .failure(error):
            // TODO: 에러 표시로 변경
            print(error)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    @State static var loggedIn: Bool = false
    
    static var previews: some View {
        LoginView(viewModel: LoginViewModel(provider: ServiceProvider()))
    }
}
