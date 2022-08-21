//
//  ListView.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 19.08.22.
//

import SwiftUI

struct ListView: View {
    let categories: [Category]
    
    // MARK: - body
    var body: some View {
        ForEach(categories, id: \.self) { category in
            ListViewEntry(category: category)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ListView(categories: [Category.default, Category.default])
        }
    }
}
