//
//  MyCharacterViewModel.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/05/05.
//

import Foundation

final class MyCharacterViewModel: ObservableObject {
    @Published var someData: [Data] = []
    
    private let provider: ServiceProviderType
    
    init(provider: ServiceProviderType) {
        self.provider = provider
    }
}
