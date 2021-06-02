//
//  Int+hasError.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/06/02.
//  Copyright © 2021 Depromeet. All rights reserved.
//

import Foundation

// TODO: Error code에 따라 처리 
extension Int {
    var hasError: Bool {
        return self != 0
    }
    
    var hasNoError: Bool {
        return self == 0
    }
}
