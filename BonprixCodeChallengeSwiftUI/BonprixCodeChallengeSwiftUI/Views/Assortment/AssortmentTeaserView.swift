//
//  AssortmentTeaserView.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 19.08.22.
//

import SwiftUI

struct AssortmentTeaserView: View {
    @ObservedObject var viewModel: AssortmentViewModel
    
    // MARK: - body
    var body: some View {
        if viewModel.allCategories.count > 0 {
            TabView(selection: $viewModel.selectedCategory) {
                ForEach(viewModel.allCategories, id: \.self) { category in
                    if let image = category.image {
                        AsyncImage(withURL: image)
                    }
                }
            }
            .frame(height: 200)
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

struct AssortmentTeaserView_Previews: PreviewProvider {
    static var previews: some View {
        AssortmentTeaserView(viewModel: AssortmentViewModel(serverCommunication: ServerCommunication()))
    }
}
