//
//  LikeTabView.swift
//  instagramios
//
//  Created by SmartPhone on 09/12/2021.
//

import SwiftUI

struct ActivityTabView: View {
    @ObservedObject var viewModel: ActivityTabViewModel = ActivityTabViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(viewModel.activitiesData) { value in
                        ItemActivity(activityModel: value)
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .toolbar(content: {
                Text(Strings.activity.rawValue)
                    .frame(width: UIScreen.main.bounds.size.width - (Constants.paddingAppHorizontal * 2), alignment: .leading)
                    .font(Font.system(size: 20, weight: .bold))
                    .padding()
            })
            .padding(.horizontal, Constants.paddingAppHorizontal)
        }
    }
}

struct ActivityTabView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityTabView()
    }
}
