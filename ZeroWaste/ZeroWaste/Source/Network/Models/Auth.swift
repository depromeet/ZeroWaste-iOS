//
//  Auth.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/05/17.
//

import Foundation
import KakaoSDKAuth
import AuthenticationServices

struct JSONWebToken: Codable {
    let nickname: String
    let password: String
}

struct AppleLoginToken: Codable {
    let identifier: String
    let email: String?
}

struct KakaoLoginToken: Codable {
    let kakaoAccessToken: String
    let email: String?
    
    enum CodingKeys: String, CodingKey {
        case kakaoAccessToken = "kakao_access_token"
        case email
    }
}

struct LoginResponse: Codable {
    let id: Int?
    let identifier: String
    let email: String?
    let createdAt: String?
    let token: String?
    let userId: Int?
    let isNewUser: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case identifier    
        case email    
        case createdAt = "created_at"
        case token    
        case userId = "user_id"
        case isNewUser = "is_new_user"
    }
}

struct RefreshJSONWebToken: Codable {
    let token: String
}

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
