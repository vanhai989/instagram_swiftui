//
//  NavigationLinkHorizontal.swift
//  instagramios
//
//  Created by Hai Dev on 13/12/2021.
//

import SwiftUI

struct NavigationLinkHorizontal: View {
    var title: String
    var labelButton: String
    var viewDestination: AnyView
    var actionButton: Void? = nil
    
    var body: some View {
        return HStack {
            Text(title)
                .foregroundColor(Color(#colorLiteral(red: 0.8033397198, green: 0.8282667398, blue: 0.9940703511, alpha: 1)))
                .font(.system(size: 17))
            Button(action: {
                actionButton
            }) {
                NavigationLink(destination: viewDestination) {
                    Text(labelButton)
                        .fontWeight(.medium)
                        .foregroundColor(Color(#colorLiteral(red: 0.8033397198, green: 0.8282667398, blue: 0.9940703511, alpha: 1)))
                        .font(.system(size: 19))
                }
                
            }
        }
    }
}


//struct NavigationLinkHorizontal_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationLinkHorizontal()
//    }
//}
