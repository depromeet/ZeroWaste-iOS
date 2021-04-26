//
//  LoginView.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/04/24.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var loggedIn: Bool
    
    var body: some View {
        Text("LoginView")
        
        Button(action: { loggedIn.toggle() }, label: {
            Text("Login")
        })
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
