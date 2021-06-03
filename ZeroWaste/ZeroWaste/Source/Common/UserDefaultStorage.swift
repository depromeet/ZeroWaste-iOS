//
//  UserPropertyWrapper.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/06/03.
//  Copyright © 2021 Depromeet. All rights reserved.
//

import Foundation

class UserDefaultStorage<T> {
    let uniqueKey: String
    let defaultValue: T
    
    init(uniqueKey: String, defaultValue: T) {
        self.uniqueKey = uniqueKey
        self.defaultValue = defaultValue
    }
}

@propertyWrapper
final class CodableProperty<T: Codable>: UserDefaultStorage<T> {
    var projectedValue: CodableProperty<T> { return self }
    
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
}

@propertyWrapper
final class ValueProperty<T>: UserDefaultStorage<T> {
    var projectedValue: ValueProperty<T> { return self }
    
    var wrappedValue: T {
        get {
            UserDefaults.standard.value(forKey: uniqueKey) as? T ?? defaultValue
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: uniqueKey)
        }
    }
}

struct UserProperties {
    @CodableProperty(
        uniqueKey: "userInfo", 
        defaultValue: LoginResponse(id: 0, identifier: "", email: "", createdAt: "", token: "", userId: 0, isNewUser: false)
    )
    static var userInfo: LoginResponse?
    
    @ValueProperty(uniqueKey: "isLoggedIn", defaultValue: false)
    static var isLoggedIn: Bool
    
    @ValueProperty(uniqueKey: "isNewUser", defaultValue: true)
    static var isNewUser: Bool
}
