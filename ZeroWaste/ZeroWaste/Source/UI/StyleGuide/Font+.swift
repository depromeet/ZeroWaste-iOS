//
//  Font+.swift
//  ZeroWaste
//
//  Created by Tim on 2021/05/19.
//

import SwiftUI

extension Font {

    static func system(_ size: CGFloat,
                       _ weight: Font.Weight = .regular,
                       _ design: Font.Design = .default) -> Font {
        return .system(size: size, weight: weight, design: design)
    }

    static func kotraBold(_ size: CGFloat) -> Font {
        return .custom("KOTRA_BOLD", size: size)
    }
}
