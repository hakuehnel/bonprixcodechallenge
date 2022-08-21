//
//  BasketItemView.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 20.08.22.
//

import SwiftUI

struct BasketItemView: View {
    @Binding var item: BasketItem
    
    let removeItem: () -> ()
    
    // MARK: - body
    var body: some View {
        GroupBox {
            HStack {
                NavigationLink {
                    ProductDetailView(product: item.product)
                } label: {
                    Image(systemName: "macpro.gen1")
                        .font(.system(size: 80))
                        .foregroundColor(Color.black)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(item.product.name)")
                        .bold()
                    Text("Lieferzeit 1 - 2 Werktage")
                        .foregroundColor(.green)
                    
                    Text("Anzahl")
                    Picker("", selection: $item.amount) {
                        ForEach (1...10, id: \.self) { number in
                            Text("\(number)")
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 8) {
                    Button {
                        removeItem()
                    } label: {
                        Image(systemName: "trash")
                            .foregroundColor(.bonprixRed)
                    }
                    Button {
                        
                    } label: {
                        Image(systemName: "pencil.circle")
                            .foregroundColor(.bonprixRed)
                    }
                    Spacer()
                    
                    Text((item.product.priceInCents * item.amount).priceFormatted())
                }
                .font(.system(size: 20))
            }
        }
        .bonprixRegularText()
    }
}

struct BasketItemView_Previews: PreviewProvider {
    static var previews: some View {
        BasketItemView(item: .constant(.default)) {}
            .previewLayout(.sizeThatFits)
            .frame(height: 150)
    }
}
