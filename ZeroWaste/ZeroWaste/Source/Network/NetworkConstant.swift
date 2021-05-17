//
//  NetworkConstant.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/05/17.
//

import Foundation

typealias HTTPHeaders = [String: String]
typealias Parameters = [String: Any?]

enum HTTPTask {
    case requestHeader(urlParams: Parameters)
    case requestBody(json: Parameters)
    case none
}

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE" 
}

enum Network {
    static let baseURL: String = "https://18.217.57.135:8000/api" 
}

enum HTTPHeaderFields {
    static let authorization: String = "Authorization"
    
    static let acceptType: String = "Accept"
    static let acceptEncoding: String = "Accept-Encoding"
    static let contentType: String = "Content-Type"
    
    enum ContentType {
        static let json: String = "application/json"
    }
    
}

enum NetworkError: Error {
    case unknown
    case unableToMakeURLRequest
    case noData
    case unableToDecode
    case HTTPURLResponse
    case invalidConnection
    
    var description: String {
        return String(describing: self)
    }
}

enum NetworkResponseError: Int, Error {
    case badRequest = 400
    case authenticationFailed = 401
    case permissionDenied = 403
    case notFound = 404
    
    case contentLengthError = 413
    case quotaExceeded = 429
    case systemError = 500
    case endpointError = 503
    case timeout = 504
    
    var description: String {
        return String(describing: self)
    }
}
