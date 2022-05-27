//
//  ProfileViewModel.swift
//  instagramios
//
//  Created by Hai Dev on 24/12/2021.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    func logout() {
        SignInViewModel().isLogined = false
    }
    
}
