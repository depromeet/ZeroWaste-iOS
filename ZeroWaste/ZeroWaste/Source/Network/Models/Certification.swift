//
//  Certification.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/05/23.
//

import Foundation

struct Certification: Codable {
    let id: Int?
    let name: String?
    let owner: Int
    let missionId: Participation?
    let image: String
    let content: String
    let isPublic: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case owner
        case missionId = "mission_id"
        case image
        case content
        case isPublic = "is_public"
    }
}

extension Certification {
    struct Participation: Codable {
        let id: Int?
        let status: Status?
        let startDate: String? // date
        let endDate: String // date
        
        enum CodingKeys: String, CodingKey {
            case id
            case status
            case startDate = "start_date"
            case endDate = "end_date"
        }
    }
}

extension Certification.Participation {
    enum Status: String, Codable {
        case ready
        case participated
        case success
        case failure
    }
}
