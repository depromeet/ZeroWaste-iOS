//
//  NetworkManager.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/05/17.
//

import Foundation
import Combine

protocol NetworkManagerType {
    func request<T: Codable>(with endpoint: EndpointType, for type: T.Type) -> AnyPublisher<T, Error>
}

final class NetworkManager: NetworkManagerType {
    func request<T: Codable>(with endpoint: EndpointType, for type: T.Type) -> AnyPublisher<T, Error> {
        let decoder = JSONDecoder()
        let session = URLSession(configuration: .default)
        guard let request = try? endpoint.asURLRequest() else { 
            return Fail(error: NetworkError.unableToMakeURLRequest).eraseToAnyPublisher() 
        }
        
        print(request)
        
        return session
            .dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .mapError { _ in NetworkError.unknown }
            .flatMap { data, response -> AnyPublisher<T, Error> in
                if let response = response as? HTTPURLResponse {
                    if (200...299).contains(response.statusCode) {
                        return Just(data)
                            .decode(type: T.self, decoder: decoder)
                            .mapError { _ in NetworkError.unableToDecode }
                            .eraseToAnyPublisher()
                    } else {
                        if let networkResonseError = NetworkResponseError(rawValue: response.statusCode) {
                            return Fail(error: networkResonseError).eraseToAnyPublisher()
                        } else {
                            return Fail(error: NetworkError.unknown).eraseToAnyPublisher()    
                        }
                    }
                } else {
                    return Fail(error: NetworkError.HTTPURLResponse).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}
