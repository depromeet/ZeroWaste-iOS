//
//  LoginView.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/04/24.
//

import SwiftUI

import AuthenticationServices

struct LoginView: View {
    
    // MARK: Constants
    
    // TODO: .localized
    private enum Text {
        static let kakao: String = "KakaoTalk Login" 
        static let apple: String = "Apple Login"
        static let find: String = "id/pw find"
    }
    
    private enum Colors {
        static let yellow: Color = .yellow
        static let black: Color = .black
    }
    
    // TODO: 다른데서도 쓰일 듯
    private enum LoginType {
        case kakao
        case apple
    }
    
    // MARK: Property
    
    @Binding var loggedIn: Bool
    @StateObject var loginData: LoginViewModel = .init()
    
    var body: some View {
        VStack(alignment: .center, spacing: 50, content:  {
            drawCircleImage()
            drawLoginVStack()
            drawFindButton()
            
            // 얘는 추후 변경될 듯
            Spacer()
                .frame(width: 0, height: 50, alignment: .center)
        })
    }
}

// MARK: UI Methods

extension LoginView {
    private func drawCircleImage() -> some View {
        let circleSize: CGFloat = UIScreen.main.bounds.width / 2 
        
        return  Circle()
            .stroke()
            .frame(
                width: circleSize, 
                height: circleSize, 
                alignment: .center
            )
    }
    
    private func drawLoginVStack() -> some View {
        let buttonWidth: CGFloat = UIScreen.main.bounds.width * 0.8
        let buttonHeight: CGFloat = 60
        let cornerRadius: CGFloat = 8
        
        return VStack(alignment: .center, spacing: 10, content: {
            Button(Text.kakao, action: { })
                .frame(
                    width: buttonWidth, 
                    height: buttonHeight, 
                    alignment: .center
                )
                .background(Colors.yellow)
                .foregroundColor(Colors.black)
                .cornerRadius(cornerRadius)
            
            SignInWithAppleButton { request in
                // request parameter from apple login
                request.requestedScopes = [.email, .fullName]
                
            } onCompletion: { result in
                // getting error or success
                
                switch result {
                case let .success(user):
                    // do login with Firebase
                    print("logged in \(user)")
                    loggedIn.toggle()
                case let .failure(error):
                    print(error.localizedDescription)
                    loggedIn.toggle()
                }   
            }
            .signInWithAppleButtonStyle(.black)
            .frame(
                width: buttonWidth, 
                height: buttonHeight, 
                alignment: .center
            )
            .cornerRadius(cornerRadius)
            // 따라한 영상에서 그린 건데 hig에 맞는지 확인
//            .frame(height: buttonHeight)
//            .clipShape(Capsule())
//            .padding(.horizontal, 30)
        })
    }
    
    private func drawFindButton() -> some View {
        return Button(Text.find, action: { })
            .font(.system(size: 20))
    }
}

struct LoginView_Previews: PreviewProvider {
    @State static var loggedIn: Bool = false
    
    static var previews: some View {
        LoginView(loggedIn: $loggedIn)
    }
}
