//
//  Optional+isSome.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/05/23.
//

import Foundation

extension Optional {
    var isNone: Bool {
        return self == nil
    }

    var isSome: Bool {
        return self != nil
    }
}
