//
//  LoginModel.swift
//  instagramios
//
//  Created by Hai Dev on 14/12/2021.
//

import Foundation

typealias ResultLogin = [String: ResultItem]

struct ResultItem: Decodable  {
    var errorCode: Int
    var message: String
    var resultData: AccestToken
}

struct AccestToken: Decodable {
    var access_token: String
    var clientNum: String
}

struct MessageSignUp: Codable {
    let success: String
}
enum Settings: String {
    case isLogined
    case userInfo
}
