//
//  OnboardView.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/04/24.
//

import SwiftUI

struct ServiceIntroductionView: View {
    
    @Binding var done: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                IntroduceServiceView()
                IntroduceServiceView()
                
                Spacer()
                
                NavigationLink(
                    destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                    label: {
                        Button(action: { done.toggle() }) {
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
                )
            }
            .navigationTitle("서비스 소개")
        }
        
    }
}

struct OnboardView_Previews: PreviewProvider {
    @State static var loggedIn: Bool = false
    
    static var previews: some View {
        ServiceIntroductionView(done: $loggedIn)
    }
}
