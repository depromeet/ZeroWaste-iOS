//
//  User.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/05/17.
//

import Foundation

struct User: Codable {
    let id: Int?
    let nickname: String
    let level: Int?
    let reportedCounts: Int?
    let isNotify: Bool?
    let completedMission: Int?
    let progressingMission: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case nickname
        case level
        case reportedCounts = "reported_counts"
        case isNotify = "is_notify"
        case completedMission = "completed_mission_counts"
        case progressingMission = "progressing_mission_counts"
    }
}
