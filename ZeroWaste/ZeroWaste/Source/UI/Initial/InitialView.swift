//
//  InitialView.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/04/24.
//

import SwiftUI

struct InitialView: View {
    
    // TODO: CoreData에 저장하고 꺼내와야 할 듯?
    
    @State private var isLoggedIn: Bool = false
    @State private var isOnboardDone: Bool = false
    
    var body: some View {
        if isLoggedIn, isOnboardDone {
            ContentView()
        } else if !isOnboardDone, isLoggedIn {
            ServiceIntroductionView(done: $isOnboardDone)
        } else {
            LoginView(loggedIn: $isLoggedIn)
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
