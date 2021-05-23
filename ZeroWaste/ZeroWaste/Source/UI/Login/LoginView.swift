//
//  LoginView.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/04/24.
//

import SwiftUI
import KakaoSDKAuth
import KakaoSDKUser
import AuthenticationServices

struct AppleUser: Codable {
    let userID: String
    let firstName: String
    let lastName: String
    let email: String
    
    init?(credentials: ASAuthorizationAppleIDCredential) {
        guard let firstName = credentials.fullName?.givenName,
              let lastName = credentials.fullName?.familyName,
              let email = credentials.email
        else { return nil }
        
        self.userID = credentials.user
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
}

struct LoginView: View {
    
    // MARK: Constants
    
    // TODO: .localized
    private enum Texts {
        static let kakao: String = "KakaoTalk Login" 
        static let apple: String = "Apple Login"
        static let find: String = "id/pw find"
    }
    
    private enum Colors {
        static let yellow: Color = .yellow
        static let black: Color = .black
    }
    
    private enum Metrics {
        static let buttonWidth: CGFloat = UIScreen.main.bounds.width * 0.8
        static let buttonHeight: CGFloat = 60
        static let cornerRadius: CGFloat = 8
    }
    
    @Environment(\.colorScheme) var colorScheme
    @State var test: String = "테스트" 
    
    // TODO: 다른데서도 쓰일 듯
    private enum LoginType {
        case kakao
        case apple
    }
    
    // MARK: Property
    
    @StateObject var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 50, content:  {
            
            Text(self.test)
            drawCircleImage
            drawLoginVStack
            drawFindButton
            
            Spacer()
                .frame(
                    width: 0,
                    height: 50,
                    alignment: .center
                )
        })
    }
}

// MARK: UI Methods

extension LoginView {
    private var drawCircleImage: some View {
        let circleSize: CGFloat = UIScreen.main.bounds.width / 2 
        
        return Circle()
            .stroke()
            .frame(
                width: circleSize, 
                height: circleSize, 
                alignment: .center
            )
    }
    
    private var drawLoginVStack: some View {
        return VStack(alignment: .center, spacing: 10, content: {
            kakaoLoginButton
            appleLoginButton
        })
    }
    
    private var kakaoLoginButton: some View {
        Button(Texts.kakao, action: kakaoLogin)
            .frame(
                width: Metrics.buttonWidth, 
                height: Metrics.buttonHeight, 
                alignment: .center
            )
            .background(Colors.yellow)
            .foregroundColor(Colors.black)
            .cornerRadius(Metrics.cornerRadius)
    }
    
    private var appleLoginButton: some View {
        SignInWithAppleButton(
            .signIn,
            onRequest: configure,
            onCompletion: handle
        )
        .signInWithAppleButtonStyle(
            colorScheme == .dark ? .white : .black
        )
        .frame(
            width: Metrics.buttonWidth, 
            height: Metrics.buttonHeight, 
            alignment: .center
        )
    }
    
    private var drawFindButton: some View {
        return Button(Texts.find, action: { })
            .font(.system(size: 20))
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
                print(String(describing: error))
                return
            }
            
            print("토큰 \(String(describing: oauthToken))")
            
            self.test = "토큰 \(String(describing: oauthToken))"
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
                } else {
                    print("missing some fields", appleIdCredentials.user)
                    
                    guard let appleUserData = UserDefaults.standard.data(forKey: appleIdCredentials.user),
                          let appleUser = try? JSONDecoder().decode(AppleUser.self, from: appleUserData)
                    else { return }
                    
                    print(appleUser)
                }
            default:
                print(auth.credential)
            }
            
        case let .failure(error):
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
