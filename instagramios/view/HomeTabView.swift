//
//  HomeTabView.swift
//  instagramios
//
//  Created by SmartPhone on 09/12/2021.
//

import SwiftUI

struct HomeTabView: View {
    @ObservedObject var viewModel: HomeTabViewModel = HomeTabViewModel()
    
    init() {
        viewModel.getPosts()
    }
    
    var body: some View {
        NavigationView {
            VStack() {
                ScrollView(showsIndicators: false) {
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(viewModel.users) { user in
                                    ImageCircle(user: user)
                                }
                            }
                            .padding(.horizontal, 10)
                            .frame(maxHeight: .infinity)
                        }
                        ScrollView {
                            LazyVStack {
                                ForEach(viewModel.posts, id: \.self) { post in
                                    ItemPost(
                                        post: post,
                                        likeAction: {viewModel.likeAction()},
                                        clickMoreAction: {viewModel.clickMoreAction()},
                                        commentAction: {viewModel.commentAction()},
                                        sendAction: {viewModel.sendAction()},
                                        ribonAction: {viewModel.ribonAction()}
                                    )
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(Images.logoString.rawValue)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.black)
                        .scaledToFill()
                        .frame(width: 100, height: 30)
                        .padding(.leading, 20)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(alignment: .center) {
                        NavigationLink(destination: CreatePosts()) {
                            Image(Images.plus_unselected.rawValue)
                                .resizable()
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: 30, height: 30)
                        }
                        NavigationLink(destination: CommunicateView()) {
                            Image(Images.icon_comment.rawValue)
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.green)
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: 30, height: 28)
                        }
                    }
                }
            })
            .fullScreenCover(isPresented: $viewModel.isReLogin) {
                QuickLoginView(viewModel: QuickLoginViewModel())
            }
        }
    }
}

//struct HomeTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeTabView()
//    }
//}

