//
//  UserPropertyWrapper.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/06/03.
//  Copyright © 2021 Depromeet. All rights reserved.
//

import Foundation

protocol UserDefaultStorage {
    associatedtype ValueType
}

@propertyWrapper
final class UserDefaultProperty<T: Codable> {
    private let uniqueKey: String
    private let defaultValue: T
    
    var projectedValue: UserDefaultProperty<T> { return self }
    
    var wrappedValue: T {
        get {
            guard let data = UserDefaults.standard.object(forKey: uniqueKey) as? Data else { return defaultValue }
            let decodedData = try? PropertyListDecoder().decode(T.self, from: data)
            return decodedData ?? defaultValue
        }
        
        set {
            let data = try? PropertyListEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: uniqueKey)
        }
    }
    
    init(uniqueKey: String, defaultValue: T) {
        self.uniqueKey = uniqueKey
        self.defaultValue = defaultValue
    }
}

struct UserProperties {
    @UserDefaultProperty(
        uniqueKey: "userInfo", 
        defaultValue: LoginResponse(id: 0, identifier: "", email: "", createdAt: "", token: "", userId: 0, isNewUser: false)
    )
    static var userInfo: LoginResponse?
    
    @UserDefaultProperty(uniqueKey: "isLoggedIn", defaultValue: false)
    static var isLoggedIn: Bool
    
    @UserDefaultProperty(uniqueKey: "isNewUser", defaultValue: true)
    static var isNewUser: Bool
}
