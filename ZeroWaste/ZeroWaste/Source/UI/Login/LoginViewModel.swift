//
//  LoginViewModel.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/04/26.
//

import Foundation
import Combine
import KakaoSDKAuth

final class LoginViewModel: ObservableObject {
    
    // MARK: Input
    
    enum Input {
        case kakaoLogin(token: OAuthToken)
        case appleLogin(token: AppleUser)
    }
    
    func apply(_ input: Input) {
        switch input {
        case let .kakaoLogin(token): 
            kakaoLoginSubject.send(token)
            
        case let .appleLogin(token):
            appleLoginSubject.send(token)
        }
    }
    
    @Published var loginResponse: LoginResponse?
    private let kakaoLoginSubject = PassthroughSubject<OAuthToken, Never>()
    private let kakaoResponseSubject = PassthroughSubject<ResultBase<LoginResponse>, Never>()
    private let appleLoginSubject = PassthroughSubject<AppleUser, Never>()
    private let appleResponseSubject = PassthroughSubject<ResultBase<LoginResponse>, Never>()
    var bag = Set<AnyCancellable>()
    
    private let provider: ServiceProviderType
    
    init(provider: ServiceProviderType) {
        self.provider = provider
        
        bindInput()
        bindOutput()
    }
}

private extension LoginViewModel {
    func bindInput() {
        // TODO: 예제에서 provider를 캡쳐하던데 self로 하는 것과 같게 동작하는지 확인
        kakaoLoginSubject
            .flatMap { [provider] token in
                return provider.networkService.request(
                    with: Endpoint.postKakaoAuth(token: KakaoLoginToken(kakaoAccessToken: token.accessToken, email: nil)),
                    for: ResultBase<LoginResponse>.self
                )
                .catch { error -> Empty<ResultBase<LoginResponse>, Never> in
                    print("error occurred", error, error.localizedDescription)
                    return .init()
                }
            }
            .subscribe(kakaoResponseSubject)
            .store(in: &bag)
        
        appleLoginSubject
            .flatMap { [provider] token in 
                return provider.networkService.request(
                    with: Endpoint.postAppleAuth(token: AppleLoginToken(identifier: token.userID, email: token.email)),
                    for: ResultBase<LoginResponse>.self
                )
                .catch { error -> Empty<ResultBase<LoginResponse>, Never> in
                    print("error occurred", error, error.localizedDescription)
                    return .init()
                }
            }
            .subscribe(appleResponseSubject)
            .store(in: &bag)
    }
    
    func bindOutput() {
        kakaoResponseSubject
            .map { $0.data }
            .assign(to: \.loginResponse, on: self)
            .store(in: &bag)
        
        appleResponseSubject
            .map { $0.data }
            .assign(to: \.loginResponse, on: self)
            .store(in: &bag)
    }
}
