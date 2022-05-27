//
//  ItemActivity.swift
//  instagramios
//
//  Created by Hai Dev on 23/12/2021.
//

import SwiftUI

struct ItemActivity: View {
    var activityModel: ActivityModel
    var body: some View {
        HStack(alignment: .center) {
            AsyncImage(url: URL(string: activityModel.userImage)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
            }
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            
            Text(activityModel.contentAction)
                .font(.system(size: 13))
            +
            Text(" " + activityModel.timeActionAgo + "h")
                .font(.system(size: 13))
            
            Spacer()
            
            switch activityModel.activityType {
            case .likePost:
                AsyncImage(url: URL(string: activityModel.postImage)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                }
                .frame(width: 40, height: 40)
                
            case .mayKnow:
                ActivityButton(action: {}, buttonText: Strings.follow.rawValue)
            case .following:
                ActivityButton(action: {}, buttonText: Strings.following.rawValue)
            }
        }
        .padding(.vertical, 5)
    }
}

struct ItemActivity_Previews: PreviewProvider {
    
    static var previews: some View {
        let activityModel = ActivityModel(id: UUID(), userImage: Images.venom7.rawValue, contentAction: Strings.info6.rawValue, timeActionAgo: "20", postImage: Images.venom7.rawValue, activityType: ActivityType.mayKnow)
        ItemActivity(activityModel: activityModel)
    }
}

struct ActivityButton: View {
    var action: () -> Void
    var buttonText: String
    var body: some View {
        Button(action: action, label: {
            Text(buttonText)
                .frame(width: 80, height: 25)
                .font(.system(size: 15))
                .foregroundColor(buttonText == Strings.follow.rawValue ? .white : .black)
                .background(buttonText == Strings.follow.rawValue ? .blue : .white)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(buttonText == Strings.follow.rawValue ? Color.blue : Color.gray, lineWidth: 1)
                )
        })
    }
}
