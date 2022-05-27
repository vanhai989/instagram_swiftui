//
//  Constants.swift
//  instagramios
//
//  Created by SmartPhone on 09/12/2021.
//

import Foundation

class Constants {
    static let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    
    static let passwordTest = NSPredicate(format: "SELF MATCHES %@",
                                       "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$")
    static let paddingAppHorizontal: Double = 10.0
}
