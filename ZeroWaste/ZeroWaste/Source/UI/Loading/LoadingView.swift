//
//  InitialView.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/04/24.
//

import SwiftUI

struct LoadingView: View {
        
    @ObservedObject private var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        _viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        if viewModel.isLoggedIn {
            if viewModel.isNewUser {
                OnboardView()
            } else {
                ContentsTabView()
            }
        } else {
            LoginView(viewModel: self.viewModel)
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(viewModel: .init(provider: ServiceProvider()))
    }
}
