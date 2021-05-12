//
//  LoginViewModel.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/04/26.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var someData: [Data] = []
    
    private let provider: ServiceProviderType
    
    init(provider: ServiceProviderType) {
        self.provider = provider
    }
}
