//
//  BottomTab.swift
//  instagramios
//
//  Created by SmartPhone on 09/12/2021.
//

import SwiftUI

struct BottomStack: View {
    
    @State private var selection = 0
    init() {
        UITabBar.appearance().backgroundColor = .systemGray6
    }
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                HomeTabView()
                    .tabItem {
                        Image(Images.home.rawValue)
                            .renderingMode(.template)
                    }.tag(0)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                SearchTabView()
                    .tabItem {
                        Image(Images.search.rawValue)
                            .renderingMode(.template)
                    }.tag(1)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                StoryTabView()
                    .tabItem {
                        Image(Images.film.rawValue)
                            .renderingMode(.template)
                    }.tag(2)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                ActivityTabView()
                    .tabItem {
                        Image(Images.like.rawValue)
                            .renderingMode(.template)
                    }.tag(3)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                ProfileTabView()
                    .tabItem {
                        Image(Images.profile.rawValue)
                            .renderingMode(.template)
                    }.tag(4)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
            }
            
        }
        .accentColor(.black)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct BottomStack_Previews: PreviewProvider {
    static var previews: some View {
        BottomStack()
    }
}
