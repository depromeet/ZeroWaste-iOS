//
//  ServiceProvider.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/05/05.
//

import Foundation

protocol ServiceProviderType {
    var networkService: NetworkManagerType { get }
}

final class ServiceProvider: ServiceProviderType {
    lazy var networkService: NetworkManagerType = NetworkManager()
}
