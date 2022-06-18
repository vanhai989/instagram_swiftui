//
//  ItemPost.swift
//  instagramios
//
//  Created by Hai Dev on 11/12/2021.
//

import SwiftUI

struct ItemPost: View {
    let post: PostModel
    let likeAction: () -> Void
    let clickMoreAction: () -> Void
    let commentAction: () -> Void
    let sendAction: () -> Void
    let ribonAction: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                HStack(alignment: .center, spacing: 10){
                    AsyncImage(url: URL(string: post.postImage )) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    }
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                    
                    Text(post.username )
                        .font(.system(size: 14, weight: .bold))
                }
                Spacer()
                Button(action: clickMoreAction, label: {
                    Image(Images.icon_more.rawValue)
                        .fixedSize()
                        .frame(width: 30, height: 20)
                        .scaledToFill()
                }
                )
            }
            .padding(.horizontal, 10)
            
            AsyncImage(url: URL(string: post.postImage )) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
            }
            .frame(width: UIScreen.main.bounds.width, height: 250)
            
            HStack(alignment: .center, spacing: 10) {
                Button(action: likeAction, label: {
                    Image(Images.like_unselected.rawValue)
                        .frame(width: 15, height: 15)
                        .padding(5)
                })
                
                Button(action: commentAction, label: {
                    Image(Images.comment.rawValue)
                        .frame(width: 15, height: 15)
                        .padding(5)
                })
                
                Button(action: sendAction, label: {
                    Image(Images.send2.rawValue)
                        .frame(width: 15, height: 15)
                        .padding(5)
                })
                
                Spacer()
                Button(action: ribonAction, label: {
                    Image(Images.ribbon.rawValue)
                        .fixedSize()
                        .frame(width: 15, height: 15)
                        .padding(5)
                })
            }
            .padding(.horizontal, 10)
            
            Group{
                Text(post.username ?? "none")
                    .font(.headline)
                + Text(" ")
                + Text(post.contentPost ?? "none")
                    .font(.system(size: 13))
                Text(MockData().randomString(length: 10) + Strings.atherLiked.rawValue)
                    .font(.system(size: 13, weight: .bold))
            }
            .padding(.horizontal, 10)
        }.onAppear {
            print("post.postImage", post.postImage ?? "")
        }
    }
}

func ribonAction() {
    print("asd")
}
