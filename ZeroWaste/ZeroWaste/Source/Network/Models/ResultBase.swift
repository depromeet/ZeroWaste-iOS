//
//  ResultBase.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/05/27.
//

import Foundation

struct ResultBase<T: Codable>: Codable {
    let error_code: Int
    let data: T
}
