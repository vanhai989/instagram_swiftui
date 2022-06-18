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
        let networkManager = NetworkManager(data: [:], url: nil, service: .updateAvatar, method: .put)
        networkManager.uploadPost(service: .createPosts, image: avatar, params: [:]) {
            (result: Result<UserModel,Error>) in
            self.isLoading = false
            switch result{
            case .success(let response):
                print("response", response)
            case .failure(let error):
                print(error)
            }
        }
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
