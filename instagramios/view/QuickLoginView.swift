//
//  QuickLogin.swift
//  instagramios
//
//  Created by Hai Dev on 18/06/2022.
//

import SwiftUI

struct QuickLoginView: View {
    @ObservedObject var viewModel: QuickLoginViewModel = QuickLoginViewModel()
    
    var body: some View {
        NavigationView {
            
            Loading(isShowing: $viewModel.isLoading) {
                VStack {
                    
                    Image(Images.logoString.rawValue)
                        .resizable()
                        .frame(width: 230, height: 70)
                    Spacer()
                    Button(action: {print("quick login")}) {
                        Text("if do not you").foregroundColor(.black)
                            .frame(minWidth: 200, maxWidth: .infinity)
                            .padding()
                            .background( Color(.purple).opacity(0.5) )
                            .foregroundColor(.white)
                            .font(.headline)
                            .font(.system(size: 20))
                            .cornerRadius(5)
                    }
                    Button(action: {print("quick login")}) {
                        Text("Quick Login")
                            .frame(minWidth: 200, maxWidth: .infinity)
                            .padding()
                            .background( Color(.green).opacity(0.5) )
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
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
}

struct QuickLoginView_Previews: PreviewProvider {
    static var previews: some View {
        QuickLoginView()
    }
}

