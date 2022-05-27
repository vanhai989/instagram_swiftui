//
//  VideoModel.swift
//  instagramios
//
//  Created by Hai Dev on 19/12/2021.
//

import Foundation

import Foundation
import AVFoundation

struct Video : Identifiable {
    var id = UUID()
    var player : AVPlayer
    var likes: String
    var comments: String
    var caption: String
    var user: User
}
