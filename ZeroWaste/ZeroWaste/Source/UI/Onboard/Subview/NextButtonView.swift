//
//  NextButtonView.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/05/02.
//

import SwiftUI

struct NextButtonView: View {
//    @Binding var done: () -> Void
    
    var body: some View {
        Button(action: {}) {
            Text("다음")
                .foregroundColor(.black)
        }
        .frame(
            width: UIScreen.main.bounds.width,
            height: 50
        )
        .border(Color.black, width: 1)
        .background(Color.gray)
    }
}

struct NextButtonView_Previews: PreviewProvider {
    @State static var temp: () -> Void = { }
    
    static var previews: some View {
        NextButtonView()
    }
}
