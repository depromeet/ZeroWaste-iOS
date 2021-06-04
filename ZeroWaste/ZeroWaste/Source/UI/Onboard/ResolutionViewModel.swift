//
//  ResolutionViewModel.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/05/05.
//

import Foundation

final class ResolutionViewModel: ObservableObject {
    @Published var someData: [Data] = []
    
    let provider: ServiceProviderType
    
    init(provider: ServiceProviderType) {
        self.provider = provider
    }
}
