//
//  BasketItem.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 20.08.22.
//

import Foundation

struct BasketItem: Identifiable, Equatable {
    let id = UUID()
    let product: Product
    var amount: Int
    
    static let `default` = BasketItem(product: .init(name: "Shoe", priceInCents: 2499), amount: 1)
    
    static func == (lhs: BasketItem, rhs: BasketItem) -> Bool {
        return lhs.id == rhs.id
    }
}
