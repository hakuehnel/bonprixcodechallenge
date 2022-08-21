//
//  ProductDetailView.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 20.08.22.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
    @State var selectedSize: Int = 36
    
    // MARK: - body
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                // image page view with dummy SF Symbols
                TabView {
                    ForEach (1...3, id: \.self) { id in
                        Image(systemName: "macpro.gen\(id)")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(12)
                    }
                }
                .frame(height: 400)
                .tabViewStyle(.page)
                .onAppear {
                    UIPageControl.appearance().pageIndicatorTintColor = .bonprixRed
                }
                
                Text(product.priceInCents.priceFormatted())
                    .font(.title)
                
                Text("inkl. MwSt. zzgl. Versandkosten")
                    .bonprixRegularText()
                
                Text(product.name)
                    .font(.title2)
                
                Text("Größe: \(selectedSize)")
                    .bonprixRegularText()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach (36...42, id: \.self) { size in
                            ZStack {
                                Text("\(size)")
                                    .padding(10)
                                .border(.black)
                                if selectedSize == size {
                                    VStack {
                                        Spacer()
                                        Rectangle()
                                            .foregroundColor(.bonprixRed)
                                        .frame(height: 5)
                                    }
                                }
                            }
                            .onTapGesture {
                                withAnimation {
                                    selectedSize = size
                                }
                            }
                        }
                    }
                }
                
                
            }
            .padding()
        }
        
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: .default)
            .previewLayout(.sizeThatFits)
    }
}
