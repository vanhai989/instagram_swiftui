//
//  SignUpViewModel.swift
//  instagramios
//
//  Created by SmartPhone on 09/12/2021.
//

import Foundation
import Combine

class SignUpViewModel: ObservableObject
{
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    @Published var messageEmailErr = ""
    @Published var messageUsernameErr = ""
    @Published var messagePasswordErr = ""
    @Published var isLoading: Bool = false
    @Published var showingAlert = false
    @Published var isSignUpSuccess: Bool = false
    @Published var isActiveNavigate: Bool = false
    @Published var isValid = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    func selectImage() -> Void {
        print("on clicked select image!")
    }
    
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
                if value.count < 8 {
                    return false
                } else if value.count > 15 {
                    return false
                }
                else {
                    return true
                }
            }
            .eraseToAnyPublisher()
    }
    
    private var isUsernameValidPublisher: AnyPublisher<Bool, Never> {
        $username
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map {
                value in
                if value.isEmpty {
                    return false
                } else {
                    return true
                }
            }
            .eraseToAnyPublisher()
    }

    private var isValidForm: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest3(isEmailValidPublisher, isPasswordValidPublisher, isUsernameValidPublisher)
            .map{ isValidEmail, isValidPassword, isUsernameValid in
                isValidEmail && isValidPassword && isUsernameValid
            }
            .eraseToAnyPublisher()
    }
    
    func navigateToSignInView() {
        self.isActiveNavigate = true
    }

    func onSignUp() -> Void {
        self.isLoading = true
        let body: [String : Any] = ["email": self.email,"password": self.password, "name": self.username]
        let networkManager = NetworkManager(data: body, url: nil, service: .users, method: .post)
            networkManager.executeQuery(){
                         (result: Result<UserModel,Error>) in
                        self.isLoading = false
                         switch result{
                         case .success(_):
                             self.isSignUpSuccess = true
                         case .failure(let error):
                             print(error)
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
                valid ? "" : Strings.passwordInvalid.rawValue
            }
            .assign(to: \.messagePasswordErr, on: self)
            .store(in: &cancellableSet)
        
        isUsernameValidPublisher
            .receive(on: RunLoop.main)
            .map {
                valid in
                valid ? "" : Strings.requiredField.rawValue
            }
            .assign(to: \.messageUsernameErr, on: self)
            .store(in: &cancellableSet)
        
        isValidForm
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
            .store(in: &cancellableSet)
    }
}
