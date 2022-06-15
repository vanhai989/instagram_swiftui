//
//  ProfileViewModel.swift
//  instagramios
//
//  Created by Hai Dev on 24/12/2021.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    
    func clear() {
           let defaults = UserDefaults.standard
           defaults.removeObject(forKey: "accessToken")
           defaults.synchronize()
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
                self.clear()
                SignInViewModel().isLogined = false
                
            case .failure(let error):
                print(error)
                
                
            }
        }
    }
}
