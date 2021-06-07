//
//  Encodable+toJSON.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/06/07.
//  Copyright © 2021 Depromeet. All rights reserved.
//

import Foundation

extension Encodable {
    func toJSON(_ encoder: JSONEncoder = JSONEncoder()) throws -> [String: Any] {
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let data = try encoder.encode(self)
        let object = try JSONSerialization.jsonObject(with: data)
        guard let json = object as? [String: Any] else {
            throw NetworkError.unableToEncode 
        }
        return json
    }
}
