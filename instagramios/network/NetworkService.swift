//
//  Networking.swift
//  instagramios
//
//  Created by Hai Dev on 14/12/2021.
//

import Foundation
// MARK: services
enum services :String{
    case healthcheck = "healthcheck"
    case login = "api/sessions"
    case signUp = "api/users"
}

// MARK: baseURL
var baseURL: String {
    switch NetworkManager.networkEnviroment {
        case .dev: return "http://127.0.0.1:3000/"
        case .production: return "http://127.0.0.1:3000/"
        case .stage: return "http://127.0.0.1:3000/"
    }
}

class NetworkService : NSObject{
    
}
