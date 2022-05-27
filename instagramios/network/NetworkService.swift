//
//  Networking.swift
//  instagramios
//
//  Created by Hai Dev on 14/12/2021.
//

import Foundation
import Alamofire

class Requests {
    
    func callSignIn(api: String,email: String, password: String ,completion:@escaping (ResultLogin?) -> ()) {
        
        guard let url = URL(string: api) else { fatalError("Missing URL") }
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(email.data(using: .utf8)!, withName: "email")
            multipartFormData.append(password.data(using: .utf8)!, withName: "password")
        }, to: url)
            .responseDecodable(of: ResultLogin.self) { response in
                
                switch response.result {
                case .success(let value):
                    completion(value)
                    //   completion(try? SomeRequest(protobuf: value))
                case .failure(_):
                    completion(nil)
                    //   completion(nil)
                }
                
                //                switch response.result {
                //                       case .success(let data):
                //                           do {
                //                               print("data \(data.value)")
                //                               let myStruct = try JSONDecoder().decode(Mainsite.self, from: data)
                ////                               completion(myStruct)
                //                           } catch { print(error) }
                //                       case .failure(let error): print(error)
                //                       }
                
            }
    }
    
    
    func callSignUp(api: String,username: String, fullname: String, password: String ,completion:@escaping (MessageSignUp?) -> ()) {
        
        guard let url = URL(string: api) else { fatalError("Missing URL") }
        
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(username.data(using: .utf8)!, withName: "username")
            multipartFormData.append(fullname.data(using: .utf8)!, withName: "fullname")
            multipartFormData.append(password.data(using: .utf8)!, withName: "password")
        }, to: url)
            .responseDecodable(of: MessageSignUp.self) { response in
                
                switch response.result {
                case .success(let value):
                    completion(value)
                case .failure(_):
                    completion(nil)
                }
            }
        
    }
}
