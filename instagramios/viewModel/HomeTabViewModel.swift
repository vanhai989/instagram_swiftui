//
//  HomeTabViewModel.swift
//  instagramios
//
//  Created by SmartPhone on 09/12/2021.
//

import Foundation

class HomeTabViewModel: ObservableObject
{
    @Published var users: [User] = MockData().users
    @Published var posts: [Post] = [Post(username: "", nameImage: "", postImage: "", contentPost: "", createdAt: "", updatedAt: "")]
    
    func getPosts () {
        NetworkManager(data: [:], url: nil, service: .getPosts, method: .get, isJSONRequest: false).executeQuery(){
            
            (result: Result<[Post],Error>) in
            switch result{
            case .success(let response):
                self.posts = response
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
    func likeAction() {
        print("clicked like this post")
    }
    func clickMoreAction() {
        print("clickMoreAction like this post")
    }
    func commentAction() {
        print("commentAction like this post")
    }
    func sendAction() {
        print("sendAction like this post")
    }
    func ribonAction() {
        print("ribonAction like this post")
    }
    
}
