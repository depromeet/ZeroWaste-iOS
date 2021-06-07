//
//  Participation.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/05/23.
//

import Foundation

struct BlockList {
    let id: Int?
    let targetUserId: Int
    let reporterId: Int
    let description: Description?
    
    enum CodingKeys: String, CodingKey {
        case id
        case targetUserId = "target_user_id"
        case reporterId = "reporter_id"
        case description
    }
}

extension BlockList {
    enum Description: Int, Codable {
        case zero
        case one
        case two
        case three
        case four
    }
}
