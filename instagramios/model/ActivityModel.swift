//
//  UserModel.swift
//  instagramios
//
//  Created by Hai Dev on 13/12/2021.
//

import Foundation

struct ActivityModel: Decodable, Identifiable {
    var id = UUID()
    var userImage: String
    var contentAction: String
    var timeActionAgo: String
    var postImage: String
    var activityType: ActivityType
}

enum ActivityType: Decodable {
    case likePost
    case following
    case mayKnow
}
