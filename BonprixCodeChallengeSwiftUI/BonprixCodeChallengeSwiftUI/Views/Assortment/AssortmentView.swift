//
//  AssortmentView.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 19.08.22.
//

import SwiftUI

struct AssortmentView: View {
    @StateObject var viewModel = AssortmentViewModel(serverCommunication: ServerCommunication())
    
    // MARK: - body
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    SearchBar()
                        .padding(.horizontal, 10)
                    
                    AssortmentTeaserView(viewModel: viewModel)
                        .navigationBarTitle("Sortiment", displayMode: .large)
                        .padding(.horizontal, 10)
                    
                    ShopNavigationBar(viewModel: viewModel)
                    
                    ListView(categories: viewModel.selectedCategory.children ?? [])
                }
            }
            .padding(0)
        }
        .padding(0)
        .onAppear {
            viewModel.loadAssortments()
        }
    }
}

struct AssortmentView_Previews: PreviewProvider {
    static var previews: some View {
        AssortmentView()
    }
}
