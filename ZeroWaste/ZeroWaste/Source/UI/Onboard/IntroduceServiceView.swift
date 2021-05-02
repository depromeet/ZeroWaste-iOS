//
//  IntroduceServiceView.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/05/02.
//

import SwiftUI

struct IntroduceServiceView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            
            VStack {
                Text("소개 명")
                Text("소개글 작성")
                
                Spacer()
            }
            
            Spacer()

            Image("icon_character_would_you")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
        }
        .frame(height: 100)
        .padding()
        .border(Color.black, width: 1)
        
    }
}

struct IntroduceServiceView_Previews: PreviewProvider {
    static var previews: some View {
        IntroduceServiceView()
    }
}
