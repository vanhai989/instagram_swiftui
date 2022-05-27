//
//  instagramiosApp.swift
//  instagramios
//
//  Created by SmartPhone on 09/12/2021.
//

import SwiftUI

@main
struct instagramiosApp: App {
    var body: some Scene {
        WindowGroup {
            if !SignInViewModel().isLogined {
                SignInView().environmentObject(SignInViewModel())
            }
            else {
                BottomStack()
            }
        }
    }
}
