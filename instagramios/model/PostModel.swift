//
//  PostModel.swift
//  instagramios
//
//  Created by Hai Dev on 30/12/2021.
//

import Foundation
import Combine
import SwiftUI

// MARK: - Post
struct PostModel: Codable, Hashable {
    let id, username, nameImage: String
    let postImage: String
    let contentPost, user: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case username, nameImage, postImage, contentPost, user
        case v = "__v"
    }
}

