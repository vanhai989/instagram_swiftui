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
    @Published var contentPostValue = ""
    @Published var isLoading: Bool = false
    @Published var messageContentPostErr = ""
    @Published var isValid = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    @EnvironmentObject var alerter: Alerter
    init() {
  
        isContentPostValidPublisher
            .receive(on: RunLoop.main)
            .map {
                valid in
                valid ? "" : Strings.requiredField.rawValue
            }
            .assign(to: \.messageContentPostErr, on: self)
            .store(in: &cancellableSet)
        
        if !Connectivity.isConnectedToInternet() {
            print("internet is not available.")
            return;
        }
        
    }
    
    private var isContentPostValidPublisher: AnyPublisher<Bool, Never> {
        $contentPostValue
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map {
                value in
                if value.isEmpty {
                    self.messageContentPostErr = Strings.requiredField.rawValue
                    return false
                }
                else {
                    self.messageContentPostErr = ""
                    return true
                }
            }
            .eraseToAnyPublisher()
    }
    
    
    func submit(image: UIImage) {
        if(self.contentPostValue.isEmpty) {
            return
        }
        self.isLoading = true

        let params: [String : Any] = ["contentPost": self.contentPostValue]
        let networkManager = NetworkManager(data: params, url: nil, service: .sessions, method: .post)
        networkManager.uploadPost(service: .createPosts, image: image, params: params) {
            (result: Result<PostModel,Error>) in
            self.isLoading = false
            switch result{
            case .success(let response):
                print("response", response)
            case .failure(let error):
//                self.alerter.alert = Alert(title: Text("Hello from SomeChildView!"))
                print("error999", error)
            }
        }
    }
}
