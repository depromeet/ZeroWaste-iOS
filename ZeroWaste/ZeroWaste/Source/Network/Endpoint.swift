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
    case postAuth(token: JSONWebToken)
    case postKakaoAuth(token: KakaoLoginToken)
    case postRefreshAuth(token: RefreshJSONWebToken)
    case postAppleAuth(token: AppleLoginToken)
    
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
        case .postAuth:
            return "/jwt-auth/"
            
        case .postKakaoAuth:
            return "/jwt-auth/kakao/"
            
        case .postRefreshAuth:
            return "/jwt-auth/refresh/"
            
        case .postAppleAuth:
            return "/jwt-auth/apple/"
        
        case .getUserList:
            return "/users/"
        
        case .getUser(let id), .putUser(let id), .patchUser(let id), .deleteUser(let id):
            return "/users/\(id)/"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getUser, .getUserList:
            return .get
            
        case .patchUser:
            return .patch
            
        case .postAuth, .postKakaoAuth, .postRefreshAuth, .postAppleAuth:
            return .post
            
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
            
        case let .putUser(id):
            return .requestBody(json: ["id": id])
            
        case let .patchUser(id):
            return .requestBody(json: ["id": id])
            
        case let .postAuth(token):
            return .requestBody(json: ["temp": token.nickname])
            
        case let .postKakaoAuth(token):
            return .requestBody(json: [
                "kakao_access_token": token.kakaoAccessToken,
                "email": token.email
            ])
            
        case let .postAppleAuth(token):
            return .requestBody(json: [
                "identifier": token.identifier,
                "email": token.email
            ])
            
        case let .postRefreshAuth(token):
            return .requestBody(json: ["token": token.token])
            
        case .deleteUser:
            // TODO: Auth 다시 확인
            return .requestHeader(urlParams: ["Authorization": "something"])
        }
    }
    
    var headers: HTTPHeaders? {
        return [
            HTTPHeaderFields.acceptType: HTTPHeaderFields.ContentType.json,
            HTTPHeaderFields.token: HTTPHeaderFields.tokenKey,
            HTTPHeaderFields.contentType: HTTPHeaderFields.ContentType.json
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
            try encodeHeader(&request, with: urlParams)
            
        case .requestBody(let json):
            try encodeBody(&request, with: json)
        
        case .none:
            break
        }
        
        return request
    }
    
    private func encodeHeader(_ request: inout URLRequest, with parameter: Parameters?) throws {
        guard let parameter = parameter else { return }
        guard let url = request.url else { throw NetworkError.parameterEncoding }
        
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false),
           !parameter.isEmpty {
            urlComponents.queryItems = [URLQueryItem]()
            
            for (key, value) in parameter.compactMapValues({ $0 }) {
                let queryItem = URLQueryItem(name: key, value: "\(value)")
                
                urlComponents.queryItems?.append(queryItem)
            }
            
            request.url = urlComponents.url
        }
    }
    
    private func encodeBody(_ request: inout URLRequest, with parameter: Any?) throws {
        guard let parameter = parameter else { return }
        
        do {
            print(parameter)
            
            let data = try JSONSerialization.data(withJSONObject: parameter, options: [])
            
            request.httpBody = data
        } catch {
            throw NetworkError.jsonEncoding
        }
    }
}