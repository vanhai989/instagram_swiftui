//
//  User.swift
//  instagramios
//
//  Created by Hai Dev on 30/12/2021.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    let userName: String
    let userImage: String
}

