//
//  PostModel.swift
//  instagramios
//
//  Created by Hai Dev on 30/12/2021.
//

import Foundation

struct Post: Identifiable, Codable{
    var id: String? = UUID().uuidString
    var username: String?
    var nameImage: String?
    var postImage: String?
    var contentPost: String?
    var createdAt: String?
    var updatedAt: String?
}
