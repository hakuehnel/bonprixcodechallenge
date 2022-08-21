//
//  BasketView.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 20.08.22.
//

import SwiftUI

struct BasketView: View {
    // MARK: - layout config
    var gridLayout: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 8), count: 1)
    
    @StateObject var viewModel = BasketViewModel()
    
    // MARK: - state properties
    @State var login: Bool = false
    
    // MARK: - body
    var body: some View {
        NavigationView {
            if viewModel.basketItems.isEmpty {
                EmptyBasketView(login: $login)
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Text("Meine Einkaufstasche")
                            .font(.system(size: 32))
                            .padding()
                        Text("Gesamtsumme (\(viewModel.numberOfItems) Artikel): \(viewModel.basketSum.priceFormatted())")
                        
                        Button {
                        } label: {
                            ZStack {
                                Color.bonprixRed
                                    .cornerRadius(8)
                                HStack {
                                    Text("Zur Kasse")
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 12).bold())
                                }
                                .foregroundColor(.white)
                                .font(.bonprixMedium)
                            }
                            .frame(height: 40)
                            .padding(.horizontal)
                        }
                        
                        LazyVGrid(columns: gridLayout, content: {
                            ForEach($viewModel.basketItems, id: \.id) { item in
                                BasketItemView(item: item) {
                                    viewModel.remove(item: item.wrappedValue)
                                }
                            }
                        })
                        .padding()
                    }
                }
                .bonprixRegularText()
                .navigationBarTitle("Einkaufstasche", displayMode: .inline)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
            .previewLayout(.sizeThatFits)
    }
}
