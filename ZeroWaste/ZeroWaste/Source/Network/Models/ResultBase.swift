//
//  ResultBase.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/05/27.
//

import Foundation

struct ResultBase<T: Codable>: Codable {
    let errorCode: Int
    let data: T
    
    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case data
    }
}
