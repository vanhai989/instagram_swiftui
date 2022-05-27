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
    @Published var posts: [Post] = MockData().posts
    
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
