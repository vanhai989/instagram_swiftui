//
//  StoryTabView.swift
//  instagramios
//
//  Created by SmartPhone on 09/12/2021.
//

import SwiftUI

struct StoryTabView: View {
    @State private var videos = MockData().videos
    
    var body: some View {
        ZStack{
            PlayerPageView(videos: self.$videos)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }
}

struct StoryTabView_Previews: PreviewProvider {
    static var previews: some View {
        StoryTabView()
    }
}
