//
//  ProfileViewModel.swift
//  instagramios
//
//  Created by Hai Dev on 24/12/2021.
//

import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    var user: LoginModel = getUser()
    @Published var onSignOut: Bool = false
    
    func updateAvatar (avatar: UIImage) {
        self.isLoading = true
        let networkManager = NetworkManager(data: [:], url: nil, service: .emptyEnpoint, method: .put)
        networkManager.uploadPost(service: .updateAvatar, image: avatar, imageWithName: "avatar", method: .put, params: [:]) {
            (result: Result<UserModel,Error>) in
            self.isLoading = false
            switch result{
            case .success(let response):
                let oldUser = getUser()
                let newLoginModel = LoginModel(accessToken: oldUser.accessToken, refreshToken: oldUser.refreshToken, user: response)
                cacheToken(token: newLoginModel)
                dump(getUser())
            case .failure(let error):
                print(error)
            }
        }
        self.isLoading = false
    }
    
    
    func logout() {
        self.isLoading = true
        let networkManager = NetworkManager(data: [:], url: nil, service: .sessions, method: .delete)
        SignInViewModel().isLogined = false
        networkManager.executeQuery(){
            (result: Result<String,Error>) in
            self.isLoading = false
            switch result{
            case .success( _):
                SignInViewModel().isLogined = false
                clearToken()
            case .failure(let error):
                clearToken()
                print(error)
            }
            self.onSignOut = true
        }
    }
}
