//
//  MockData.swift
//  instagramios
//
//  Created by Hai Dev on 17/12/2021.
//

import Foundation
import AVFoundation

let imageRandom =  "https://picsum.photos/200"

struct MockData {
    let imageRandom =  "https://picsum.photos/200"
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    let users: [User] = [
        User(id: UUID(), userName: "bandalls", userImage: "https://picsum.photos/200"),
        User(id: UUID(), userName: "ortspoon", userImage: "https://picsum.photos/200"),
        User(id: UUID(), userName: "reallychel", userImage: "https://picsum.photos/200"),
        User(id: UUID(), userName: "blikimore", userImage: "https://picsum.photos/200"),
        User(id: UUID(), userName: "bootecia", userImage: "https://picsum.photos/200"),
        User(id: UUID(), userName: "hyperyaufarer", userImage: "https://picsum.photos/200"),
        User(id: UUID(), userName: "oranolio", userImage: "https://picsum.photos/200"),
        User(id: UUID(), userName: "stonewellforever", userImage: "https://picsum.photos/200"),
        User(id: UUID(), userName: "spuffyffet", userImage: "https://picsum.photos/200"),
        User(id: UUID(), userName: "wattlexp", userImage: "https://picsum.photos/200"),
        User(id: UUID(), userName: "bookman", userImage: "https://picsum.photos/200"),
        User(id: UUID(), userName: "hyperyaufarer", userImage: "https://picsum.photos/200"),
        User(id: UUID(), userName: "dravenfact", userImage: "https://picsum.photos/200")
    ]
    
    let posts: [Post] = [
        Post(id: UUID(), username: "bandalls",  postImage: "https://picsum.photos/200", contentPost: "He has been given a large brain by mistake, since for him the spinal cord would surely suffice. This disgrace to civilization should be done away with at once. since for him the spinal cord would surely suffice. This disgrace to civilization should be"),
        Post(id: UUID(), username: "ortspoon", postImage: "https://picsum.photos/200", contentPost: "He has been given a large brain by mistake, since for him the spinal cord would surely suffice. This disgrace to civilization should be done away with at once. since for him the spinal cord would surely suffice. This disgrace to civilization should be"),
        Post(id: UUID(), username: "reallychel", postImage: "https://picsum.photos/200", contentPost: "He has been given a large brain by mistake, since for him the spinal cord would surely suffice. This disgrace to civilization should be done away with at once. since for him the spinal cord would surely suffice. This disgrace to civilization should be"),
        Post(id: UUID(), username: "blikimore", postImage: "https://picsum.photos/200", contentPost: "He has been given a large brain by mistake, since for him the spinal cord would surely suffice. This disgrace to civilization should be done away with at once. since for him the spinal cord would surely suffice. This disgrace to civilization should be"),
        Post(id: UUID(), username: "bootecia", postImage: "https://picsum.photos/200", contentPost: "He has been given a large brain by mistake, since for him the spinal cord would surely suffice. This disgrace to civilization should be done away with at once. since for him the spinal cord would surely suffice. This disgrace to civilization should be"),
        Post(id: UUID(), username: "hyperyaufarer", postImage: "https://picsum.photos/200", contentPost: "He has been given a large brain by mistake, since for him the spinal cord would surely suffice. This disgrace to civilization should be done away with at once. since for him the spinal cord would surely suffice. This disgrace to civilization should be"),
        Post(id: UUID(), username: "oranolio", postImage: "https://picsum.photos/200", contentPost: "He has been given a large brain by mistake, since for him the spinal cord would surely suffice. This disgrace to civilization should be done away with at once. since for him the spinal cord would surely suffice. This disgrace to civilization should be"),
        Post(id: UUID(), username: "stonewellforever", postImage: "https://picsum.photos/200", contentPost: "He has been given a large brain by mistake, since for him the spinal cord would surely suffice. This disgrace to civilization should be done away with at once. since for him the spinal cord would surely suffice. This disgrace to civilization should be"),
        Post(id: UUID(), username: "spuffyffet", postImage: "https://picsum.photos/200", contentPost: "He has been given a large brain by mistake, since for him the spinal cord would surely suffice. This disgrace to civilization should be done away with at once. since for him the spinal cord would surely suffice. This disgrace to civilization should be"),
        Post(id: UUID(), username: "wattlexp", postImage: "https://picsum.photos/200", contentPost: "He has been given a large brain by mistake, since for him the spinal cord would surely suffice. This disgrace to civilization should be done away with at once. since for him the spinal cord would surely suffice. This disgrace to civilization should be"),
        Post(id: UUID(), username: "bookman", postImage: "https://picsum.photos/200", contentPost: "He has been given a large brain by mistake, since for him the spinal cord would surely suffice. This disgrace to civilization should be done away with at once. since for him the spinal cord would surely suffice. This disgrace to civilization should be"),
        Post(id: UUID(), username: "hyperyaufarer", postImage: "https://picsum.photos/200", contentPost: "He has been given a large brain by mistake, since for him the spinal cord would surely suffice. This disgrace to civilization should be done away with at once. since for him the spinal cord would surely suffice. This disgrace to civilization should be"),
        Post(id: UUID(), username: "dravenfact", postImage: "https://picsum.photos/200", contentPost: "He has been given a large brain by mistake, since for him the spinal cord would surely suffice. This disgrace to civilization should be done away with at once. since for him the spinal cord would surely suffice. This disgrace to civilization should be")
    ]
    
    func getActivityData() -> [ActivityModel] {
        var activityDatas: [ActivityModel] = []
        for index in 0..<50 {
            let activityType = index % 2 == 0 ? ActivityType.likePost : index % 3 == 0 ? ActivityType.following : ActivityType.mayKnow
            let randomContent = index % 2 == 0 ? Strings.info3.rawValue : Strings.info1.rawValue
            let contentAction = Strings.info6.rawValue + Strings.info2.rawValue + randomContent
            
            let newActivityModel =  ActivityModel(id: UUID(),userImage: imageRandom, contentAction: contentAction, timeActionAgo: String(index), postImage: imageRandom, activityType: activityType)
            activityDatas.append(newActivityModel)
        }
        return activityDatas;
    }
    
    func getUserAvatarData() -> [UserAvatar] {
        var userAvatarData: [UserAvatar] = []
        for _ in 0..<30 {
            let usernameRandom = randomString(length: 9)
            let newUserAvatar = UserAvatar(urlString: imageRandom, Username: usernameRandom)
            userAvatarData.append(newUserAvatar)
        }
        return userAvatarData
    }
    
    let followingData: [FollowModel] = [
        FollowModel(followNumber: "205", followType: "Posts"),
        FollowModel(followNumber: "364", followType: "Followers"),
        FollowModel(followNumber: "358", followType: "Following")
    ]
    
    let videos: [Video] = [
        Video(player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "demo1", ofType: "mp4")!)),
              likes: "1M",
              comments: "12.7k",
              caption: "This disgrace to civilization should be done away with at once. since for him the spinal cord would surely suffice.",
              user: User(userName: "cristiano", userImage: "https://picsum.photos/200")),
        Video(player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "demo2", ofType: "mp4")!)),
              likes: "2M",
              comments: "22k",
              caption: "This disgrace to civilization should be done away with at once. since for him the spinal cord would surely suffice.",
              user: User(userName: "spuffyffet", userImage: "https://picsum.photos/200")),
        Video(player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "demo3", ofType: "mp4")!)),
              likes: "1M",
              comments: "52.8k",
              caption: "This disgrace to civilization should be done away with at once. since for him the spinal cord would surely suffice.",
              user: User(userName: "hyperyaufarer", userImage: "https://picsum.photos/200")),
    ]
}
