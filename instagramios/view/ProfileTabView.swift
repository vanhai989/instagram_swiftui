//
//  ProfileTabView.swift
//  instagramios
//
//  Created by SmartPhone on 09/12/2021.
//

import SwiftUI

struct ProfileTabView: View {
    @ObservedObject var viewModel: ProfileViewModel = ProfileViewModel()
    @State var onSignOut: Bool = false
    
    var body: some View {
        NavigationView {
            Loading(isShowing: $viewModel.isLoading) {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        HStack(alignment: .center) {
                            AsyncImage(url: URL(string: imageRandom)) { image in
                                image.resizable()
                                    .frame(width: 100, height: 100, alignment: .center)
                                    .cornerRadius(50)
                                    .clipped()
                            } placeholder: {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                                    .frame(maxWidth: 50, maxHeight: 50)
                            }
                            .padding()
                            
                            Spacer()
                            ForEach(MockData().followingData) { value in
                                FollowItem(numberFollow: value.followNumber, followType: value.followType)
                                Spacer()
                            }
                        }
                        .padding(.bottom, 10)
                        ListInfomationItem(info1: Strings.info1.rawValue, info2: Strings.info2.rawValue, info3: Strings.info3.rawValue, info4: Strings.info4.rawValue, info5: Strings.info5.rawValue, info6: Strings.info6.rawValue)
                        
                        HStack(alignment: .center, spacing: 20) {
                            ButtonText(action: actionButton, buttonText: Strings.buttonEdit.rawValue)
                            ButtonText(action: actionButton, buttonText: Strings.buttonSaved.rawValue)
                        }
                        
                        HStack(alignment: .center) {
                            ButtonImage(action: actionButton, image: Images.plus_unselected.rawValue)
                            Spacer()
                            ButtonImage(action: actionButton, image: Images.film.rawValue)
                            Spacer()
                            ButtonImage(action: actionButton, image: Images.profile.rawValue)
                        }
                        .padding(.horizontal, 60)
                        .padding(.vertical, 10)
                        
                    }
                    .padding(.horizontal, Constants.paddingAppHorizontal)
                    ImageGrid(numberOfImage: 20)
                }
                
                .navigationBarTitle("", displayMode: .inline)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text(Strings.userName.rawValue)
                            .font(Font.system(size: 20, weight: .bold))
                            .padding()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            Image(Images.plus_unselected.rawValue)
                                .resizable()
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: 30, height: 30)
                            Button {
                                viewModel.logout()
                                onSignOut = true
                            } label: {
                                Image(Images.list.rawValue)
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(.gray)
                                    .aspectRatio(1, contentMode: .fit)
                                    .frame(width: 30, height: 28)
                            }
                        }
                    }
                })
                .fullScreenCover(isPresented: $onSignOut) {
                    let viewModel = SignInViewModel()
                    SignInView(viewModel: viewModel)
                }
            }
        }
    }
    
    func actionButton() {
        print("as")
    }
}

struct ProfileTabView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTabView()
    }
}

struct FollowItem: View {
    var numberFollow: String
    var followType: String
    var body: some View {
        VStack {
            Text(numberFollow)
                .font(Font.system(size: 15, weight: .bold))
            Text(followType)
                .font(Font.system(size: 13))
        }
        .padding(.horizontal, 5)
    }
}

struct ListInfomationItem: View {
    var info1: String
    var info2: String
    var info3: String
    var info4: String
    var info5: String
    var info6: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text(info1)
                Text(info2)
                Text(info3)
                Text(info4)
                Text(info5)
                Text(info6)
            }
            .font(.system(size: 13))
        }
    }
}

struct ButtonText: View {
    var action: () -> Void
    var buttonText: String
    var body: some View {
        Button(action: action, label: {
            Text(buttonText)
                .frame(maxWidth: .infinity, minHeight: 30)
                .foregroundColor(.black)
                .font(.system(size: 14))
                .overlay(
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(Color.gray, lineWidth: 1)
                )
        })
    }
}
