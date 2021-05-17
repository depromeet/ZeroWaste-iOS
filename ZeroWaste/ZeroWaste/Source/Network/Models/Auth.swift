//
//  Auth.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/05/17.
//

import Foundation

struct JSONWebToken: Codable {
    let nickname: String
    let password: String
}

struct KakaoLoginToken: Codable {
    let kakaoAccessToken: String
    let email: String
    
    enum CodingKeys: String, CodingKey {
        case kakaoAccessToken = "kakao_access_token"
        case email
    }
}

struct RefreshJSONWebToken: Codable {
    let token: String
}
