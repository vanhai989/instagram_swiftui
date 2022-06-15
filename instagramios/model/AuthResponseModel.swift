//
//  AuthResponseModel.swift
//  instagramios
//
//  Created by Hai Dev on 14/06/2022.
//

import Foundation

struct HeathModel: Codable {
        var message: String
}

struct LoginModel: Codable {
        var accessToken: String?
        var refreshToken: String?
        var user: UserModel?
}


struct UserModel: Codable {
    var _id: String?
    var email: String?
    var name: String?
    var createdAt: String?
    var updatedAt: String?
    var __v: Int?
}
