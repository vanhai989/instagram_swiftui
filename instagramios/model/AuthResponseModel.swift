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

struct UserModel: Codable, Hashable {
    let id, email, password, name: String?
    let createdAt, updatedAt: String?
    let v: Int?
    let avatar: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case email, password, name, createdAt, updatedAt
        case v = "__v"
        case avatar
    }
}
