//
//  HomeTabViewModel.swift
//  instagramios
//
//  Created by SmartPhone on 09/12/2021.
//

import Foundation
import SwiftUI

class HomeTabViewModel: ObservableObject
{
    @EnvironmentObject var alerter: Alerter
    @Published var users: [User] = MockData().users
    @Published var posts: [PostModel] = []
    @State var isReLogin: Bool = false
    
    func getPosts () {
        NetworkManager(data: [:], url: nil, service: .getPosts, method: .get, isJSONRequest: false).executeQuery(){
            
            (result: Result<[PostModel],Error>) in
            switch result{
            case .success(let response):
                print("response", response)
                self.posts = response
//                self.alerter.alert = Alert(title: Text("Hello from SomeChildView!"))
            case .failure(let error):
                print(error)
                let errorCode = (error as NSError).code
                if (errorCode == 403) {
//                    self.alerter.alert = Alert(title: Text("Thông báo!"), message: Text("Phiên làm việc của bạn đã hết hạn"), primaryButton: .destructive(Text("Quick login")) {
//                        print("Quick login...")
//                        self.isReLogin = true
//                    },
//                                               secondaryButton: .cancel())
//                    self.alerter.alert = Alert(title: Text("Hello from SomeChildView!"))
                }
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
