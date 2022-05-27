//
//  SearchTabView.swift
//  instagramios
//
//  Created by SmartPhone on 09/12/2021.
//

import SwiftUI

struct SearchTabView: View {
    @ObservedObject var viewModel: SearchTabViewModel = SearchTabViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.vertical) {
                SearchBar(searchText: $viewModel.searchText)
                ImageGrid(numberOfImage: 100)
            }
        }
    }
}

struct SearchTabView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTabView()
    }
}
