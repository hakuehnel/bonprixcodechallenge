//
//  ListViewEntry.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 19.08.22.
//

import SwiftUI

struct ListViewEntry: View {
    let category: Category
    
    // MARK: - body
    var body: some View {
        NavigationLink {
            if let children = category.children {
                ScrollView {
                    VStack {
                        ListView(categories: children)
                        .listStyle(.inset)
                        .padding(0)
                        .navigationBarTitle(category.label, displayMode: .inline)
                    }
                }
            } else if let url = category.url {
                WebView(urlAsString: url)
                    .navigationBarTitle(category.label, displayMode: .inline)
                    .toolbar {
                        Button {
                        } label: {
                            Image(systemName: "magnifyingglass")
                        }
                    }
            }
        } label: {
            HStack {
                Text(category.label)
                    .bonprixRegularText()
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .foregroundColor(.black)
            .padding()
        }
        .frame(height: 30)
    }
}

struct ListViewEntry_Previews: PreviewProvider {
    static var previews: some View {
        ListViewEntry(category: .default)
    }
}
