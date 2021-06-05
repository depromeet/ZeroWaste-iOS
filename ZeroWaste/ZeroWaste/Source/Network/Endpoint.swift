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
    // MARK: Admin
    case bazziList
    case bazziCreate(bazzi: Bazzi)
    case bazziRead(id: Int)
    case bazziUpdate(id: Int, bazzi: Bazzi)
    case bazziPartialUpdate(id: Int, bazzi: Bazzi)
    case bazziDelete(id: Int)

    // MARK: Batch
//    case batchParticipationCreate // 아직 미구현인듯
    
    // MARK: BlockList
    case blockList
    case blockListCreate(blockList: BlockList)
    case blockListRead(id: Int)
    case blockListUpdate(id: Int, blockList: BlockList)
    case blockListPartialUpdate(id: Int, blockList: BlockList)

//    // MARK: Certification
//    case certificationList
//    case certificationListCreate
//    case certificationListRead
//    case certificationListUpdate
//    case certificationListPartialUpdate
//    case certificationListDelete
    
    // MARK: Auth
    case authAppleCreate(token: AppleLoginToken)
    case authKakaoCreate(token: KakaoLoginToken)
    case authRefreshCreate(token: RefreshJSONWebToken)
    
    // MARK: Missions
    
    // MARK: Users
    case userList
    case userDoubleCheckList(nickName: String, auth: JSONWebToken)
    case userRead(id: Int)
    case usersPartialUpdate(id: Int, user: User)
    case userDelete(id: Int)
}

extension Endpoint: EndpointType {
    var baseURL: URL {
        guard let url = URL(string: Network.baseURL) else { fatalError("invalid baseURL") }
        return url
    }
    
    // MARK: Path
    
    var path: String {
        switch self {
        // MARK: Admin
        case .bazziList, .bazziCreate:
            return "/admin/bazzi/"
            
        case .bazziRead(let id), .bazziUpdate(let id, _), .bazziPartialUpdate(let id, _), .bazziDelete(let id):
            return "/admin/bazzi/\(id)/"
            
        // MARK: BlockList
        case .blockList, .blockListCreate:
            return "/blocklist/"
            
        case .blockListRead(let id), .blockListUpdate(let id, _), .blockListPartialUpdate(let id, _):
            return "/blocklist/\(id)/"
        
        // MARK: Auth
        case .authKakaoCreate:
            return "/jwt-auth/kakao/"
            
        case .authRefreshCreate:
            return "/jwt-auth/refresh/"
            
        case .authAppleCreate:
            return "/jwt-auth/apple/"
        
        // MARK: User
        case .userList:
            return "/users/"
        
        case .userRead(let id), .usersPartialUpdate(let id, _), .userDelete(let id):
            return "/users/\(id)/"
            
        case .userDoubleCheckList:
            return "/users/double_check"
        }
    }
    
    // MARK: Method
    
    var httpMethod: HTTPMethod {
        switch self {
        // MARK: Admin
        case .bazziList, .bazziRead:
            return .get
            
        case .bazziCreate:
            return .post
            
        case .bazziUpdate:
            return .put
            
        case .bazziPartialUpdate:
            return .patch
            
        case .bazziDelete:
            return .delete
            
        // MARK: BlockList
        case .blockList, .blockListRead:
            return .get
        
        case .blockListCreate:
            return .post
            
        case .blockListUpdate:
            return .put
            
        case .blockListPartialUpdate:
            return .patch
            
        // MARK: Auth
        case .authKakaoCreate, .authRefreshCreate, .authAppleCreate:
            return .post
        
        // MARK: User
        case .userRead, .userList, .userDoubleCheckList:
            return .get
            
        case .usersPartialUpdate:
            return .patch
            
        case .userDelete:
            return .delete
        }
    }
    
    // MARK: Task
    
    var task: HTTPTask {
        switch self {
        // MARK: Admin
        case .bazziList, .bazziDelete:
            return .none
        
        case .bazziCreate(let bazzi), .bazziUpdate(_, let bazzi), .bazziPartialUpdate(_, let bazzi):
            return .requestBody(json: [
                "name": bazzi.name,
                "icon_url": bazzi.iconUrl,
                "description": bazzi.description
            ])
            
        case let .bazziRead(id):
            return .requestHeader(urlParams: ["id": id])
            
        // MARK: BlockList
        
        case .blockList, .blockListRead:
            return .none
            
        case .blockListCreate(let blockList), .blockListUpdate(_, let blockList), .blockListPartialUpdate(_, let blockList):
            return .requestBody(json: [
                "target_user_id": blockList.targetUserId,
                "reporter_id": blockList.reporterId,
                "description": blockList.description
            ])
            
        // MARK: Auth
        case let .authKakaoCreate(token):
            return .requestBody(json: [
                "kakao_access_token": token.kakaoAccessToken,
                "email": token.email
            ])
            
        case let .authAppleCreate(token):
            return .requestBody(json: [
                "identifier": token.identifier,
                "email": token.email
            ])
            
        case let .authRefreshCreate(token):
            return .requestBody(json: ["token": token.token])
        
        // MARK: User
        
        case .userList, .userRead:
            return .none
            
        case let .usersPartialUpdate(_, user):
            return .requestBody(json: [
                "nickname": user.nickname,
                "level": user.level,
                "is_notify": user.isNotify,
                "description": "string"
            ])
            
        case let .userDoubleCheckList(nickName, auth):
            return .requestHeader(urlParams: [
                "nickname": nickName,
                "Authorization": auth
            ])
            
        case .userDelete:
            // TODO: Auth 다시 확인
            return .requestHeader(urlParams: ["Authorization": "something"])
        }
    }
    
    // MARK: Header
    
    var headers: HTTPHeaders? {
        return [
            HTTPHeaderFields.acceptType: HTTPHeaderFields.ContentType.json,
            HTTPHeaderFields.token: HTTPHeaderFields.tokenKey,
            HTTPHeaderFields.contentType: HTTPHeaderFields.ContentType.json,
            HTTPHeaderFields.authorization: "Token"
        ]
    }
    
    // MARK: Request
    
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
    
    // MARK: Encoder
    
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
