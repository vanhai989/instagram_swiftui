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
    @Published var users: [UserModel] = []
    @Published var posts: [PostModel] = []
    @State var isReLogin: Bool = false
    @Published var navigateToQuickLogin = false
    var alerter: Alerter?
    
    func setupEnviroment(alerter: Alerter) {
        self.alerter = alerter
    }
    
    func getUsers () {
        NetworkManager(data: [:], url: nil, service: .users, method: .get, isJSONRequest: false).executeQuery(){
            
            (result: Result<[UserModel],Error>) in
            switch result{
            case .success(let response):
             
                self.users = response
            case .failure(let error):
                let errorCode = (error as NSError).code
                print(errorCode)
            }
        }
    }
    
    func getPosts () {
        NetworkManager(data: [:], url: nil, service: .getPosts, method: .get, isJSONRequest: false).executeQuery(){
            
            (result: Result<[PostModel],Error>) in
            switch result{
            case .success(let response):
                self.posts = response
            case .failure(let error):
                let errorCode = (error as NSError).code
                if (errorCode == 403) {
                    self.alerter?.alert = Alert(title: Text("Phiên làm việc của bạn đã hết hạn!"),
                                                primaryButton: .cancel(),
                                                secondaryButton:
                                                        .default(Text("Quick login"),
                                                                 action: {
                        self.navigateToQuickLogin = true
                    }))
                } else {
                    self.alerter?.alert = Alert(title: Text("Something is wrong!"))
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
