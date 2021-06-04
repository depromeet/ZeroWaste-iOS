//
//  InitialView.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/04/24.
//

import SwiftUI

struct LoadingView: View {
        
    @State private var isLoggedIn: Bool = false
    
    let provider: ServiceProviderType = ServiceProvider()
    
    var body: some View {
        if isLoggedIn {
            ContentView()
        } else {
            let viewModel: LoginViewModel = .init(provider: provider)
            LoginView(viewModel: viewModel)
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
