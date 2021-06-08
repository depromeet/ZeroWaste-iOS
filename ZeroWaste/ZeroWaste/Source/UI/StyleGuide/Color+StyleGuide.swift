//
//  Color+StyleGuide.swift
//  ZeroWaste
//
//  Created by Tim on 2021/06/02.
//  Copyright © 2021 Depromeet. All rights reserved.
//

import SwiftUI

extension Color {

    /// 앱 메인 컬러
    static var zMain: Color { .zAurora }

    static var zSub1: Color { .zBlackHole }
    static var zSub2: Color { .zAurora }
    static var zSub3: Color { .zStarryYellow }

    static var zBackground: Color { .zGray6 }

    /// 우쥬블루(남색계열) 컬러
    static var zWouldUBlue: Color { Color(hex: "#294087") }

    /// 블랙홀(보라계열) 컬러
    static var zBlackHole: Color { Color(hex: "#4824AF") }

    /// 오로라(그린계열) 컬러
    static var zAurora: Color { Color(hex: "#43D7B3") }

    /// 반짝이 별(노란계열) 컬러
    static var zStarryYellow: Color { Color(hex: "#FFD86C") }

    static var zRed: Color { Color(hex: "#F24938") }

    // MARK: - 무채색 계열

    static var zBlack: Color { Color(hex: "#283237") }
    static var zGray0: Color { Color(hex: "#48575F") }
    static var zGray1: Color { Color(hex: "#667D89") }
    static var zGray2: Color { Color(hex: "#94A3AD") }
    static var zGray3: Color { Color(hex: "#D1D8DD") }
    static var zGray4: Color { Color(hex: "#E0E7ED") }
    static var zGray5: Color { Color(hex: "#F1F4F6") }
    static var zGray6: Color { Color(hex: "#F9F9FC") }

    static var zWhite: Color { .white }
}
