//
//  instagramiosApp.swift
//  instagramios
//
//  Created by SmartPhone on 09/12/2021.
//

import SwiftUI
import AlertToast


class Alerter: ObservableObject {
    @Published var alert: Alert? {
        didSet { isShowingAlert = alert != nil }
    }
    @Published var isShowingAlert = false
}

@main
struct instagramiosApp: App {
    @StateObject var alerter: Alerter = Alerter()
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.object(forKey: "accessToken") == nil {
                SignInView()
                    .environmentObject(alerter)
                    .alert(isPresented: $alerter.isShowingAlert) {
                        alerter.alert ?? Alert(title: Text(""))
                    }
            }
            else {
                BottomStack()
                    .environmentObject(alerter)
                    .alert(isPresented: $alerter.isShowingAlert) {
                        alerter.alert ?? Alert(title: Text(""))
                    }
            }
        }
    }
}
