//
//  Endpoint.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/05/17.
//

import Foundation

protocol EndpointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
    func asURLRequest() throws -> URLRequest
}

enum Endpoint {
    // MARK: Auth
    
    // MARK: Users
    // TODO: 네이밍 어떻게 해야할지 잘 모르겠습니다!
    case getUserList
    case getUser(id: Int)
    case putUser(id: Int)
    case patchUser(id: Int)
    case deleteUser(id: Int)
}

extension Endpoint: EndpointType {
    var baseURL: URL {
        guard let url = URL(string: Network.baseURL) else { fatalError("invalid baseURL") }
        return url
    }
    
    var path: String {
        switch self {
        case .getUserList:
            return "/users"
        case .getUser(let id), .putUser(let id), .patchUser(let id), .deleteUser(let id):
            return "/users/\(id)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getUser, .getUserList:
            return .get
            
        case .patchUser:
            return .patch
            
        case .putUser:
            return .put
            
        case .deleteUser:
            return .delete
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getUserList, .getUser:
            return .none
            
        case .putUser(let id):
            return .requestBody(json: ["id": id])
            
        case .patchUser(let id):
            return .requestBody(json: ["id": id])
            
        case .deleteUser:
            // TODO: Auth 다시 확인
            return .requestHeader(urlParams: ["Authorization": "something"])
        }
    }
    
    var headers: HTTPHeaders? {
        return [
            HTTPHeaderFields.acceptType: HTTPHeaderFields.ContentType.json,
            HTTPHeaderFields.contentType: HTTPHeaderFields.ContentType.json,
            HTTPHeaderFields.authorization: "인증"
        ]
    }
    
    func asURLRequest() throws -> URLRequest {
        var url = self.baseURL
        
        url.appendPathComponent(self.path)
        
        var request = URLRequest(url: url)
        
        request.httpMethod = self.httpMethod.rawValue
        request.allHTTPHeaderFields = self.headers
        
        switch self.task {
        case .requestHeader(let urlParams):
            // parameter encode
            break
            
        case .requestBody(let json):
            // body encode
            break
        
        case .none:
            break
        }
        
        return request
    }
    
//    private func configurePrameters(with parameter: Parameters, request: inout URLRequest) throws {
//        
//    }
}
