//
//  Font+custom.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/06/02.
//  Copyright © 2021 Depromeet. All rights reserved.
//

import Foundation
import SwiftUI

extension Font {
    static func SFProDisplayBold(size: CGFloat) -> Font {
        return .custom("SFProDisplay-Bold", size: size)
    } 
    
    static func AppleSDGothicNeo(size: CGFloat) -> Font {
        return .custom("AppleSDGothicNeo-Regular", size: size)
    }
    
    static func KotraBold(size: CGFloat) -> Font {
        return .custom("KOTRA_BOLD-Bold", size: size)
    }
}
