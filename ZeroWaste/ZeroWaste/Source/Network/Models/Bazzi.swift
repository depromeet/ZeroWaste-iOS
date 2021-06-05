//
//  Bazzi.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/06/05.
//  Copyright © 2021 Depromeet. All rights reserved.
//

import Foundation

struct Bazzi: Codable {
    let id: Int?
    let createdAt: String? // date
    let updatedAt: String? // date
    let name: String
    let iconUrl: String // URL
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case name
        case iconUrl = "icon_url"
        case description
    }
}
