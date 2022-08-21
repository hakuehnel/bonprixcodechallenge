//
//  ShopNavigationBar.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 19.08.22.
//

import SwiftUI

struct ShopNavigationBar: View {
    @ObservedObject var viewModel: AssortmentViewModel
    
    // MARK: - body
    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30){
                    ForEach(viewModel.allCategories, id: \.self) { category in
                        if let label = category.label {
                            VStack {
                                Text(label)
                                    .foregroundColor(viewModel.selectedCategory.label == label ? .bonprixRed : .bonprixGray)
                                    .animation(.none, value: viewModel.selectedCategory)
                                    .font(.bonprixMedium)
                                
                                Capsule()
                                    .fill(viewModel.selectedCategory.label == label ? .bonprixRed : .clear)
                                    .frame(height: 3)
                                    .padding(.horizontal,-10)
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation {
                                    viewModel.selectedCategory = category
                                }
                            }
                        }
                    }
                    .onAppear {
                        scrollView.scrollTo(viewModel.selectedCategory, anchor: .topTrailing)
                    }
                }
                .padding(.horizontal, 10)
                .onChange(of: viewModel.selectedCategory) { _ in
                    withAnimation{
                        scrollView.scrollTo(viewModel.selectedCategory, anchor: .topTrailing)
                    }
                }
            }
        }
    }
}
