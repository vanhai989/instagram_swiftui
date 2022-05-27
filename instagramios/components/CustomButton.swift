//
//  CustomButton.swift
//  InstagramSwiftUI
//
//  Created by Hai Dev on 07/12/2021.
//

import SwiftUI

struct CustomButtonView: View {
    var destinationView: AnyView
    var disable: Bool
    var buttonName: String
    let action: () -> Void
    @Binding var isActiveNavigate: Bool
    
    let backGroundColorDisable =  Color(.purple).opacity(0.1)
    let backGroundColorEnable = Color(.purple).opacity(0.5)
    
    var body: some View {
        NavigationLink(destination: destinationView, isActive: $isActiveNavigate) {
            Button(action: action) {
                Text(buttonName)
                    .frame(minWidth: 200, maxWidth: .infinity)
                    .padding()
                    .background(disable ? backGroundColorDisable: backGroundColorEnable )
                    .foregroundColor(.white)
                    .font(.headline)
                    .font(.system(size: 20))
                    .cornerRadius(5)
            }
        }
        .disabled(disable)
    }
}
