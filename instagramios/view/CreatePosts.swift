//
//  CreatePosts.swift
//  instagramios
//
//  Created by Hai Dev on 15/06/2022.
//

import SwiftUI

struct CreatePosts: View {
    @ObservedObject var viewModel: CreatePostViewModel = CreatePostViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image("ic_back")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
            Text("Go back")
        }
    }
    }
    var body: some View {
        NavigationView {
            
            Loading(isShowing: $viewModel.isLoading) {
                VStack {
                    Button(action: {viewModel.selectImage()}) {
                        Image(Images.imagePlus.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .frame(width: 150, height: 150)
                    }
                    
                    CustomTextField(isSecure: false, placeholder: Text(Strings.email.rawValue).foregroundColor(.white).font(.headline),
                                    field: $viewModel.username, prompt: viewModel.messageUsernameErr)
                    
                    CustomTextField( isSecure: false, placeholder: Text(Strings.password.rawValue).foregroundColor(.white).font(.headline),
                                    field: $viewModel.contentPost,  prompt: viewModel.messageContentPostErr)
                    Spacer()
                        
                }
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all))
                
            }

//                   .navigationBarItems(leading: btnBack)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    btnBack
                }
                ToolbarItem(placement: .principal) {
                    Text("Create post")
                        .font(.largeTitle)
                }
            })
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
}

struct CreatePosts_Previews: PreviewProvider {
    static var previews: some View {
        CreatePosts()
    }
}
