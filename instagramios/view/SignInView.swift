//
//  SigninView.swift
//  InstagramSwiftUI
//
//  Created by Hai Dev on 07/12/2021.
//

import SwiftUI
import AlertToast

struct SignInView: View {
    @ObservedObject var viewModel: SignInViewModel = SignInViewModel()
    @EnvironmentObject var alerter: Alerter
    
    var body: some View {
        NavigationView {
            Loading(isShowing: $viewModel.isLoading) {
                VStack(alignment: .center, spacing: 15) {
                    
                    Image(Images.logoString.rawValue)
                        .resizable()
                        .frame(width: 230, height: 70)
                    
                    CustomTextField(isSecure: false, placeholder: Text(Strings.email.rawValue).foregroundColor(.white).font(.headline),
                                    field: $viewModel.email, prompt: viewModel.messageEmailErr)
                    
                    CustomTextField(isSecure: true, placeholder: Text(Strings.password.rawValue).foregroundColor(.white).font(.headline),
                                    field: $viewModel.password,  prompt: viewModel.messagePasswordErr)
                    
                    CustomButtonView(destinationView: AnyView(BottomStack()), disable: !viewModel.isValid, buttonName: Strings.login.rawValue, action: viewModel.login, isActiveNavigate: $viewModel.isLogined)

                    NavigationLinkHorizontal(title: Strings.forgotPassword.rawValue, labelButton: Strings.helpSignIn.rawValue, viewDestination: AnyView( ForgotPasswordView()))
                    
                    Spacer()
                    
                    NavigationLinkHorizontal(title: Strings.dontHaveAccount.rawValue, labelButton: Strings.signUp.rawValue,
                                             viewDestination: AnyView(SignUpView()))
                    .onAppear {
                        self.viewModel.setupEnviroment(alerter: self.alerter)
                    }
                }
                .alert(isPresented: $viewModel.showingAlert) {
                    Alert(title: Text(Strings.login_failed.rawValue), message: Text(Strings.messageInvalidLogin.rawValue), dismissButton: .default(Text(Strings.close.rawValue)))
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


struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
