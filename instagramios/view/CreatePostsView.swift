//
//  CreatePosts.swift
//  instagramios
//
//  Created by Hai Dev on 15/06/2022.
//

import SwiftUI

struct CreatePosts: View {
    @State private var isShowPhotoLibrary = false
    @ObservedObject var viewModel: CreatePostViewModel = CreatePostViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var image = UIImage()
    @EnvironmentObject var alerter: Alerter
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image("ic_back")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
            Text("Go back").foregroundColor(.white)
        }
    }
    }
    var body: some View {
        NavigationView {
            
            Loading(isShowing: $viewModel.isLoading) {
                VStack {
                    Button(action: {self.isShowPhotoLibrary = true}) {
//                        Image(Images.imagePlus.rawValue)
//                            .resizable()
//                            .renderingMode(.template)
//                            .foregroundColor(.white)
//                            .frame(width: 150, height: 150)
                        Text("Choose image")
                    }
                    
                    Image(uiImage: self.image).resizable().scaledToFit().frame(width: 200, height: 200, alignment: .center)
                    
                    NavigationLink(destination: AnyView(QuickLoginView(viewModel: QuickLoginViewModel())), isActive: $viewModel.navigateToQuickLogin) {
                        Text("")
                    }
                
                    TextEditor(text: $viewModel.contentPostValue)
                        .foregroundColor(.secondary)
                    Text(viewModel.messageContentPostErr).foregroundColor(.red)
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.caption)
                        .frame(height: 3)
                    Spacer()
                    Button(action: {viewModel.submit(image: self.image)}) {
                        Text("Submit")
                            .frame(minWidth: 200, maxWidth: .infinity)
                            .padding()
                            .background( Color(.purple).opacity(0.5) )
                            .foregroundColor(.white)
                            .font(.headline)
                            .font(.system(size: 20))
                            .cornerRadius(5)
                    }
                    
                    
                }
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all))
                .sheet(isPresented: $isShowPhotoLibrary) {
                    ImagePicker(sourceType: .photoLibrary) { image in
                        self.image = image
                    }
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    btnBack
                }
                ToolbarItem(placement: .principal) {
                    Text("Create post")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }
            })
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            self.viewModel.setupEnviroment(alerter: self.alerter)
        }
    }
    
}

//struct CreatePosts_Previews: PreviewProvider {
//    static var previews: some View {
//        CreatePosts()
//    }
//}
