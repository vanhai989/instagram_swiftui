//
//  HeaderView.swift
//  instagramios
//
//  Created by Hai Dev on 11/12/2021.
//

import SwiftUI

struct HeaderView: View {
//    let title: LocalizedStringKey
//    let subtitle: LocalizedStringKey
//    var bgColor: Color
    var body: some View {
        
        HStack(alignment: .center) {
            Image(Images.logoString.rawValue)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.black)
                .scaledToFill()
                .frame(width: 80, height: 30)
                .padding(.leading, 20)
            
            Spacer()
            HStack(alignment: .center, spacing: 20) {
                NavigationLink(destination: CommunicateView()) {
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
        .padding(.horizontal, Constants.paddingAppHorizontal)
        .padding(.vertical, 10)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
