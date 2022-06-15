//
//  CreatePostViewModel.swift
//  instagramios
//
//  Created by Hai Dev on 15/06/2022.
//

import Foundation
import SwiftUI
import Combine

class CreatePostViewModel: ObservableObject
{
    @Published var username = ""
    @Published var contentPost = ""
    @Published var isLoading: Bool = false
    @Published var messageUsernameErr = ""
    @Published var messageContentPostErr = ""
    @Published var isValid = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        
        isUsernameValidPublisher
            .receive(on: RunLoop.main)
            .map {
                valid in
                valid ? "" : Strings.requiredField.rawValue
            }
            .assign(to: \.messageUsernameErr, on: self)
            .store(in: &cancellableSet)
        
        isContentPostValidPublisher
            .receive(on: RunLoop.main)
            .map {
                valid in
                valid ? "" : Strings.requiredField.rawValue
            }
            .assign(to: \.messageContentPostErr, on: self)
            .store(in: &cancellableSet)
        
        isValidForm
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
            .store(in: &cancellableSet)
        
        if !Connectivity.isConnectedToInternet() {
            print("internet is not available.")
            return;
        }
        
    }
    
    private var isUsernameValidPublisher: AnyPublisher<Bool, Never> {
        $username
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map {
                value in Constants.emailPredicate.evaluate(with: value)
            }
            .eraseToAnyPublisher()
    }
    
    private var isContentPostValidPublisher: AnyPublisher<Bool, Never> {
        $contentPost
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
        Publishers.CombineLatest(isUsernameValidPublisher, isContentPostValidPublisher)
            .map{ isValidUsername, isValidContentPost in
                isValidUsername && isValidContentPost
            }
            .eraseToAnyPublisher()
    }
    
    func selectImage () {
        print("TODO: handle get img form this device")
    }
    
    func submit() {
//        self.isLoading = true
//        let body: [String : Any] = ["email": self.email,"password": self.password]
//        let networkManager = NetworkManager(data: body, url: nil, service: .sessions, method: .post)
//        networkManager.executeQuery(){
//            (result: Result<LoginModel,Error>) in
//            self.isLoading = false
//            switch result{
//            case .success(let response):
//                self.isLogined = true
//                self.cache(token: response)
//
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
}
