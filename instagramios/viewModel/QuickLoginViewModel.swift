//
//  QuickLoginViewModel.swift
//  instagramios
//
//  Created by Hai Dev on 18/06/2022.
//

import Foundation

import Foundation
import SwiftUI
import Combine

class QuickLoginViewModel: ObservableObject
{
    @Published var contentPostValue = ""
    @Published var isLoading: Bool = false
    @Published var messageContentPostErr = ""
    @Published var isValid = false
    
  
}
