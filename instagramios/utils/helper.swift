//
//  helper.swift
//  instagramios
//
//  Created by Hai Dev on 18/06/2022.
//

import Foundation

func cacheToken(token: LoginModel) {
    let defaults = UserDefaults.standard
    defaults.set(try? PropertyListEncoder().encode(token), forKey: "accessToken")
    defaults.synchronize()
}

func getToken() -> String {
    let defaults = UserDefaults.standard
    guard let tokenData = defaults.object(forKey: "accessToken") as? Data,
          let accessToken = try? PropertyListDecoder().decode(LoginModel.self, from: tokenData) else {
              return ""
          }
    return accessToken.accessToken ?? ""
}

func getUser() -> LoginModel {
    let defaults = UserDefaults.standard
    let emptyData: LoginModel = LoginModel(accessToken: "", refreshToken: "", user: UserModel(id: "", email: "", password: "", name: "", createdAt: "", updatedAt: "", v: 0, avatar: ""))
    guard let tokenData = defaults.object(forKey: "accessToken") as? Data,
          let user = try? PropertyListDecoder().decode(LoginModel.self, from: tokenData) else {
              return emptyData
          }
    return user
}

func clearToken() {
    let defaults = UserDefaults.standard
    defaults.removeObject(forKey: "accessToken")
    defaults.synchronize()
}


