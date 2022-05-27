//
//  CommonModel.swift
//  instagramios
//
//  Created by Hai Dev on 24/12/2021.
//

import Foundation

struct UserAvatar: Decodable {
    var urlString: String
    var Username: String
}

struct FollowModel: Identifiable {
    var id = UUID()
    var followNumber: String
    var followType: String
}
