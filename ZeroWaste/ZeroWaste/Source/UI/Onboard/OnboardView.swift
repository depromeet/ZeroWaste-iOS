//
//  OnboardView.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/04/24.
//

import SwiftUI

struct OnboardView: View {
    
    @Binding var done: Bool
    
    var body: some View {
        Text("OnboardView")
        
        Button(action: { done.toggle() }, label: {
            Text("done")
        })
    }
}

//struct OnboardView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardView()
//    }
//}
