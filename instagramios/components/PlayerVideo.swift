//
//  TestScrollMoveOneItemOnce.swift
//  instagramios
//
//  Created by Hai Dev on 19/12/2021.
//

import SwiftUI
import AVKit

protocol ViewLifecycleDelegate {
    func onAppear()
    func onDisappear()
}

struct Player : UIViewControllerRepresentable {
    
    var player : AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController{
        let view = AVPlayerViewController()
        view.player = player
        view.showsPlaybackControls = false
        view.videoGravity = .resizeAspectFill
        return view
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}

struct PlayerVideo : View {
    @Binding var videos : [Video]
    let lifecycleDelegate: ViewLifecycleDelegate?
    
    var body: some View{
        VStack(spacing: 0){
            ForEach(self.videos){video in
                ZStack{
                    Player(player: video.player)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .offset(y: -10)
                    VStack {
                        Group {
                            HStack {
                                Spacer()
                                VStack {
                                    ButtonIcon(action: {}, image: Images.like_unselected.rawValue, value: video.likes)
                                    ButtonIcon(action: {}, image: Images.icon_comment.rawValue, value: video.comments)
                                    ButtonIcon(action: {}, image: Images.send2.rawValue, value: "")
                                }
                            }
                            UserButton(action: {}, urlString: video.user.userImage, username: video.user.userName)
                            HStack(alignment: .center, spacing: 10) {
                                Text(video.caption)
                                    .font(.system(size: 13))
                                    .foregroundColor(.white)
                                Spacer()
                                AsyncImage(url: URL(string: video.user.userImage)) { image in
                                    image.resizable()
                                        .frame(width: 35, height: 35)
                                        .scaledToFit()
                                        .cornerRadius(10)
                                        .overlay(RoundedRectangle(cornerRadius: 10)
                                                    .stroke(.white, lineWidth: 4))
                                } placeholder: {
                                    ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                                }
                                .frame(width: 35, height: 35)
                            }
                        }
                        .padding(.horizontal, 10)
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .foregroundColor(Color.primary)
                    .padding(.top, UIScreen.main.bounds.height / 2 + 30)
                }
            }
        }
        .onAppear {
            self.lifecycleDelegate?.onAppear()
        }
        .onDisappear {
            self.lifecycleDelegate?.onDisappear()
        }
    }
}

struct PlayerPageView : UIViewRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return PlayerPageView.Coordinator(parent1: self)
    }
    
    @Binding var videos : [Video]
    
    func makeUIView(context: Context) -> UIScrollView{
        
        let view = UIScrollView()
        
        let childView = UIHostingController(rootView: PlayerVideo(videos: self.$videos, lifecycleDelegate: context.coordinator))
        childView.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((videos.count)))
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((videos.count)))
        
        view.addSubview(childView.view)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.contentInsetAdjustmentBehavior = .never
        view.isPagingEnabled = true
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        uiView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((videos.count)))
        
        for i in 0..<uiView.subviews.count{
            uiView.subviews[i].frame = CGRect(x: 0, y: 0,width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((videos.count)))
        }
    }
    
    class Coordinator : NSObject, UIScrollViewDelegate, ViewLifecycleDelegate{
        
        var parent : PlayerPageView
        var index = 0
        init(parent1 : PlayerPageView) {
            parent = parent1
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let currentindex = Int(scrollView.contentOffset.y / UIScreen.main.bounds.height)
            
            if index != currentindex{
                parent.videos[index].player.seek(to: .zero)
                parent.videos[index].player.pause()
                index = currentindex
                parent.videos[index].player.play()
                parent.videos[index].player.actionAtItemEnd = .none
                NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: parent.videos[index].player.currentItem, queue: .main) { (_) in
                    self.parent.videos[self.index].player.seek(to: .zero)
                    self.parent.videos[self.index].player.play()
                }
            }
        }
        
        func onAppear() {
            parent.videos[self.index].player.seek(to: .zero)
            parent.videos[self.index].player.play()
        }
        
        func onDisappear() {
            parent.videos[self.index].player.seek(to: .zero)
            parent.videos[self.index].player.pause()
        }
        
    }
}

struct ButtonIcon: View {
    var action: () -> Void
    var image: String
    var value: String
    var body: some View {
        Button(action: action, label:  {
            VStack {
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                Text(value)
                    .foregroundColor(.white)
                    .font(.system(size: 15))
            }
        })
    }
}
