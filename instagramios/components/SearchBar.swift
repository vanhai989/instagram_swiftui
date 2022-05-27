//
//  SearchBar.swift
//  instagramios
//
//  Created by Hai Dev on 18/12/2021.
//

import SwiftUI


struct SearchBar: View {
    @Binding var searchText: String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(#colorLiteral(red: 0.8871331215, green: 0.8871331215, blue: 0.8871330619, alpha: 1)))
            HStack {
                Image(systemName: Images.systemNameLass.rawValue)
                TextField(Strings.placeholderSearch.rawValue, text: $searchText)
                
                if !searchText.isEmpty {
                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: Images.systemNameX.rawValue)
                            .padding(5)
                    }
                }
            }
            .foregroundColor(.gray)
            .padding(.leading, 13)
        }
        .frame(height: 40)
        .cornerRadius(10)
        .padding(.horizontal, 5)
        .padding(.vertical, 10)
    }
}


struct SearchBar_Previews: PreviewProvider {
    @State static var text = ""
    static var previews: some View {
        SearchBar(searchText: $text)
    }
}
