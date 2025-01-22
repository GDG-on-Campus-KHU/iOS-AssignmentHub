//
//  API.swift
//  GDG-WeeklyiOS-2dubu
//
//  Created by 이건우 on 1/22/25.
//

import Foundation
import Moya

enum MyAPI {
    case jsonplaceholder(id: String)
}

extension MyAPI: TargetType {
    var baseURL: URL {
        switch self {
        case .jsonplaceholder:
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
                return URL(string: "dummy")!
            }
            return url
        }
    }
    
    var path: String {
        switch self {
        case .jsonplaceholder(let id):
            return "/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .jsonplaceholder:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .jsonplaceholder:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
