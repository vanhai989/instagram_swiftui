//
//  SignupView.swift
//  InstagramSwiftUI
//
//  Created by Hai Dev on 02/12/2021.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewModel: SignUpViewModel = SignUpViewModel()
    
    var body: some View {
        NavigationView {
            Loading(isShowing: $viewModel.isLoading) {
                VStack(alignment: .center, spacing: 15) {
                    
                    Button(action: {viewModel.selectImage()}) {
                        Image(Images.imagePlus.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .frame(width: 150, height: 150)
                    }
                    
                    Group {
                        CustomTextField(isSecure: false, placeholder: Text(Strings.email.rawValue).foregroundColor(.white).font(.headline),
                                        field: $viewModel.email, prompt: viewModel.messageEmailErr)
                        
                        CustomTextField(isSecure: true, placeholder: Text(Strings.password.rawValue).foregroundColor(.white).font(.headline),
                                        field: $viewModel.password, prompt: viewModel.messagePasswordErr)
                        
                        CustomTextField(isSecure: false, placeholder: Text(Strings.fullname.rawValue).foregroundColor(.white).font(.headline),
                                        field: $viewModel.fullname, prompt: viewModel.messagefullnameErr)
                        
                        CustomTextField(isSecure: false, placeholder: Text(Strings.username.rawValue).foregroundColor(.white).font(.headline),
                                        field: $viewModel.username, prompt: viewModel.messageUsernameErr)
                        
                        CustomButtonView(destinationView: AnyView(SignInView()), disable: !viewModel.isValid, buttonName: Strings.signUp.rawValue, action: viewModel.onSignUp, isActiveNavigate: $viewModel.isActiveNavigate)
                    }
                    
                    Spacer()
                    
                    NavigationLinkHorizontal(title: Strings.alreadyAccount.rawValue, labelButton: Strings.signIn.rawValue, viewDestination: AnyView( SignInView()))
                }
                .alert(viewModel.isSignUpSuccess ? Strings.signUpComplete.rawValue : Strings.signUp_failed.rawValue, isPresented: $viewModel.showingAlert) {
                    Button(Strings.oK.rawValue, role: .cancel) {
                        if viewModel.isSignUpSuccess {
                            viewModel.navigateToSignInView()
                        }
                    }
                }
                .navigationBarHidden(true)
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all))
                .contentShape(Rectangle())
                .onTapGesture {}
                .onLongPressGesture(
                    pressing: { isPressed in if isPressed { self.endEditing() } },
                    perform: {})
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
