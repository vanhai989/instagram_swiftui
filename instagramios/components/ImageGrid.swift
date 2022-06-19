//
//  ImageGrid.swift
//  instagramios
//
//  Created by Hai Dev on 22/12/2021.
//

import SwiftUI

struct ImageGrid: View {
    var numberOfImage: Int
    let gridItemLayout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        LazyVGrid(columns: gridItemLayout) {
            ForEach(0..<numberOfImage) { index in
                AsyncImage(url: URL(string: imageRandom)) { image in
                    image.resizable()
                        .scaledToFill()
                        .clipped()
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                }
                .frame(width: UIScreen.main.bounds.size.width / 3, height: UIScreen.main.bounds.size.width / 3)
            }
        }
    }
}

//struct ImageGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageGrid(numberOfImage: 20)
//    }
//}

struct ImageCircle: View {
    let user: UserModel
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: user.avatar ?? imageRandom)) { image in
                image.resizable()
                    .scaledToFill()
                    .cornerRadius(30)
                    .overlay(Circle().stroke(Color.red, lineWidth: 2))
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
            }
            .frame(width: 60, height: 60)
            .padding([.top, .horizontal], 5)
            Text(user.name ?? "asdasd")
                .truncationMode(.tail)
                .font(.system(size: 13))
                .frame(width: 80, height: 15)
        }
    }
}

