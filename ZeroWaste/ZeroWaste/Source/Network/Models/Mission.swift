//
//  Mission.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/05/23.
//

import Foundation

struct Mission: Codable {
    let id: Int?
    let name: String?
    let owner: Int
    let place: Place?
    let theme: String?
    let difficulty: Difficulty?
    let logoImageUrl: String
    let iconImageUrl: String
    let content: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case owner
        case place
        case theme
        case difficulty
        case logoImageUrl = "logo_img_url"
        case iconImageUrl = "icon_img_url"
        case content
    }
}

extension Mission {
    enum Place: String, Codable {
        case etc
        case kitchen
        case bathroom
        case cafe
        case restaurant
        case outside
    }
    
    enum Difficulty: String, Codable {
        // TODO: 이거 되는지 확인
        case veryEasy = "very_easy"
        case easy
        case medium
        case hard
        case extraHard = "extra_hard"
    }
}
