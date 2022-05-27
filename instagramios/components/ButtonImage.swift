//
//  ButtonImage.swift
//  instagramios
//
//  Created by Hai Dev on 22/12/2021.
//

import SwiftUI

struct ButtonImage: View {
    var action: () -> Void
    var image: String
    var body: some View {
        Button(action: action, label:  {
            Image(image)
                .resizable()
                .frame(width: 30, height: 30)
        })
    }
}

struct ButtonImage_Previews: PreviewProvider {
    static var previews: some View {
        ButtonImage(action: {print("as")}, image: Images.plus_unselected.rawValue)
    }
}


struct UserButton: View {
    var action: () -> Void
    var urlString: String
    var username: String
    var body: some View {
        HStack {
            HStack(alignment: .center, spacing: 10){
                AsyncImage(url: URL(string: urlString)) { image in
                    image.resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                }
                Text(username)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            Spacer()
            Button(action: action, label: {
                Image(Images.icon_more.rawValue)
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .fixedSize()
                    .frame(width: 20, height: 20)
                    .scaledToFill()
                    .padding(.horizontal, 8)
            }
            )
        }
    }
}
