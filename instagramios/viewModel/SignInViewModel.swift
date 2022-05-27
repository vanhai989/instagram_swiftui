//
//  SigninViewModel.swift
//  InstagramSwiftUI
//
//  Created by Hai Dev on 07/12/2021.
//

import Foundation
import SwiftUI
import Combine

class SignInViewModel: ObservableObject
{
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading: Bool = false
    @Published var showingAlert = false
    
    @Published var messageEmailErr = ""
    @Published var messagePasswordErr = ""
    @Published var isValid = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    @AppStorage(Settings.isLogined.rawValue) var isLogined: Bool = false
    
    private var isEmailValidPublisher: AnyPublisher<Bool, Never> {
        $email
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map {
                value in Constants.emailPredicate.evaluate(with: value)
            }
            .eraseToAnyPublisher()
    }
    
    private var isPasswordValidPublisher: AnyPublisher<Bool, Never> {
        $password
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map {
                value in
                if value.isEmpty {
                    return false
                }
                else {
                    return true
                }
            }
            .eraseToAnyPublisher()
    }
    
    private var isValidForm: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isEmailValidPublisher, isPasswordValidPublisher)
            .map{ isValidEmail, isValidPassword in
                isValidEmail && isValidPassword
            }
            .eraseToAnyPublisher()
    }
    
    func login() {
        self.isLoading = true
        Requests().callSignIn(api: apiLogin,email: self.email, password: self.password) {(resultLogin) in
            self.isLoading = false
            print("resultLogin \(String(describing: resultLogin))")
            if resultLogin != nil {
                
                self.isLogined = true
                // self.loginInfo = resultLogin!
                
            } else {
                self.isLogined = false
                self.showingAlert = true
            }
        }
    }
    
    init() {
        isEmailValidPublisher
            .receive(on: RunLoop.main)
            .map {
                valid in
                valid ? "" : Strings.emailInvalid.rawValue
            }
            .assign(to: \.messageEmailErr, on: self)
            .store(in: &cancellableSet)
        
        isPasswordValidPublisher
            .receive(on: RunLoop.main)
            .map {
                valid in
                valid ? "" : Strings.requiredField.rawValue
            }
            .assign(to: \.messagePasswordErr, on: self)
            .store(in: &cancellableSet)
        
        isValidForm
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
            .store(in: &cancellableSet)
    }
}
