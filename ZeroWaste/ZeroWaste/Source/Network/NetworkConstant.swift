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
    case none
    case requestHeader(urlParams: Parameters)
    case requestBody(json: Any)
}

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE" 
}

enum Network {
    static let baseURL: String = "http://18.217.57.135:8000/api" 
}

enum HTTPHeaderFields {
    static let authorization: String = "Authorization"
    
    static let acceptType: String = "Accept"
    static let acceptEncoding: String = "Accept-Encoding"
    static let contentType: String = "Content-Type"
    
    static let token: String = "X-CSRFToken"
    static let tokenKey: String = "XgeBBKXeSdI7KOcNLsPDpPDSkXUdTi6IhMDuIHOT0ghkrGr49k0QStfmA2vuh5NT"
    
    enum ContentType {
        static let json: String = "application/json"
    }
    
}

enum NetworkError: Error {
    case noData
    case unknown
    
    case unableToMakeURLRequest
    case jsonEncoding
    case parameterEncoding
    
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
