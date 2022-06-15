//
//  instagramiosApp.swift
//  instagramios
//
//  Created by SmartPhone on 09/12/2021.
//

import SwiftUI
import AlertToast

@main
struct instagramiosApp: App {
    @State private var showToast = true
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.object(forKey: "accessToken") == nil {
                SignInView().environmentObject(SignInViewModel()).toast(isPresenting: $showToast) {
                    AlertToast(type: .regular, title: "Message Sent!")
                }
            }
            else {
                BottomStack()
            }
        }
    }
}
