//
//  QuickLoginViewModel.swift
//  instagramios
//
//  Created by Hai Dev on 18/06/2022.
//

import Foundation

import Foundation
import SwiftUI
import Combine

class QuickLoginViewModel: ObservableObject
{
    @Published var contentPostValue = ""
    @Published var isLoading: Bool = false
    @Published var messageContentPostErr = ""
    var isActiveHomeNavigate: Bool = false
    var isActiveSignInNavigate: Bool = false
    @Published var isActiveInNavigate: Bool = false
    
    func onLogoutAndNavigateToSignIn () {
        clearToken()
        SignInViewModel().isLogined = false
        self.isActiveSignInNavigate = true
        self.isActiveInNavigate = true
        self.isActiveHomeNavigate = false
        
    }
    
    func onRefreshToken () {
        self.isLoading = true
        let body: [String : String] = ["refreshToken": String(
            getUser().refreshToken ?? "")]
        let networkManager = NetworkManager(data: body, url: nil, service: .refreshToken, method: .post)
        
        networkManager.executeQuery(){
            (result: Result<LoginModel,Error>) in
            self.isLoading = false
            switch result{
            case .success(let response):
                SignInViewModel().isLogined = true
                cacheToken(token: response)
                self.isActiveHomeNavigate = true
                self.isActiveSignInNavigate = false
                self.isActiveInNavigate = true
                
            case .failure(_):
                self.onLogoutAndNavigateToSignIn()
            }
        }
    }
    
}
