//
//  SearchBar.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 19.08.22.
//

import SwiftUI


struct SearchBar: View {
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.searchBarBackground)
                .frame(height: 36)
                .cornerRadius(6)
            HStack {
                Image(systemName: "magnifyingglass")
                Text("Wonach suchst du?")
                    .bonprixRegularText()
            }
            .foregroundColor(.searchBarTintColor)
        }
        .padding(0)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
            .previewLayout(.sizeThatFits)
    }
}
