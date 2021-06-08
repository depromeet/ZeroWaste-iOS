//
//  OnboardView.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/06/02.
//  Copyright © 2021 Depromeet. All rights reserved.
//

import SwiftUI

struct OnboardView: View {
    
    enum Texts {
        static let title1: String = "미션을 수행하며\n제로웨이스트 습관 찾기"
        static let desc1: String = "자신에게 맞는 레벨에서 요이 - 땅!\n각 레벨에 맞는 미션으로 습관을 바꿀 수 있어요 :)"
        static let title2: String = "내가 만들어가는\n제로웨이스트 미션"
        static let desc2: String = "제로웨이스트를 실천하는 사람들을 위해\n좋은 미션 아이디어를 공유해주세요"
        static let nextButton: String = "다음" 
    }
    
    @State private var isSecondPage: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 18) {
                Text(isSecondPage ? Texts.title1 : Texts.title2)
                    .foregroundColor(.black)
                    .font(Font.custom("KOTRA_BOLD-Bold", size: 22))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    
                Text(isSecondPage ? Texts.desc1 : Texts.desc2)
                    .foregroundColor(.black)
                    .font(Font.custom("SFProDisplay-Regular", size: 15))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                
                Image("icon_character_would_you")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 360)
                
                Spacer()
                    .frame(height: 74-18)
                
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        Text(Texts.nextButton)
                    }
                )
                .buttonStyle(SubmitStyle())
            }
        }
    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView()
    }
}
