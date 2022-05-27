//
//  PostModel.swift
//  instagramios
//
//  Created by Hai Dev on 30/12/2021.
//

import Foundation

struct Post: Identifiable {
    var id = UUID()
    var username: String
    var postImage: String
    var contentPost: String
}
