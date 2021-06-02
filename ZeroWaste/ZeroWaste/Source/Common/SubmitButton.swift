//
//  SubmitButton.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/06/02.
//  Copyright © 2021 Depromeet. All rights reserved.
//

import Foundation
import SwiftUI

struct SubmitStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.custom("SFProDisplay-Bold", size: 15))
            .frame(
                width: 324, 
                height: 52, 
                alignment: .center
            )
            .background(Color("main_enabled"))
            .foregroundColor(.black)
            .cornerRadius(50)
            
    }
}
