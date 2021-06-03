//
//  PledgeView.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/06/02.
//  Copyright © 2021 Depromeet. All rights reserved.
//

import SwiftUI

struct PledgeView: View {
    enum Texts {
        static let pledgeTitle: String = "서약서"
        static let pledgeDesc: String = """
                                        선서, 나는 제로우주 서비스를 통해
                                        꾸준한 미션을 진행하면서
                                        멋진 제로웨이스터가 될 것을 
                                        선서합니다!
                                        """
        static let signTitle: String = "사인하기"
        static let nicknamePlaceHolder: String = "닉네임 쟉성"
        static let startButton: String = "시작하기"
    }
    
    @State var textfieldText: String = ""
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 40)
            
            Text(Texts.pledgeTitle)
            
            Spacer()
                .frame(height: 20)
            
            ZStack {
                Color("background")
                
                VStack {
                    Spacer()
                        .frame(height: 50)
                    
                    Text(Texts.pledgeDesc)
                        .font(.SFProDisplayBold(size: 18))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                        .frame(height: 42)
                    
                    VStack(alignment: .leading, spacing: 13) {
                        Text(Texts.signTitle)
                        
                        TextField(Texts.nicknamePlaceHolder, text: $textfieldText)
                            .frame(height: 60)
                    }
                    
                    Spacer()
                        .frame(height: 25)
                }
                .padding(24)
            }
            .cornerRadius(16)
            .padding(18)
            
            Spacer()
                .frame(height: 220)
            
            Button(Texts.startButton) { 
                
            }
            .buttonStyle(SubmitStyle())
        }
    }
}

struct PledgeView_Previews: PreviewProvider {
    
    static var previews: some View {
        PledgeView()
    }
}
