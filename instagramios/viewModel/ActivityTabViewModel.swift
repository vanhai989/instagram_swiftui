//
//  ActivityTabViewModel.swift
//  instagramios
//
//  Created by Hai Dev on 24/12/2021.
//

import Foundation

class ActivityTabViewModel: ObservableObject {
    @Published var activitiesData:[ActivityModel] = MockData().getActivityData()
}
