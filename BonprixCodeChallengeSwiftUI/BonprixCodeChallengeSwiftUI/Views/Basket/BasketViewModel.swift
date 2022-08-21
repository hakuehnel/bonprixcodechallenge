//
//  BasketViewModel.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 21.08.22.
//

import Foundation

final class BasketViewModel: ObservableObject {
    @Published var basketItems: [BasketItem] = [] {
        didSet {
            var sum = 0
            var numberOfItems = 0
            
            for item in basketItems {
                sum += item.amount * item.product.priceInCents
                numberOfItems += item.amount
            }
            self.basketSum = sum
            self.numberOfItems = numberOfItems
        }
    }
    
    @Published var basketSum = 0
    @Published var numberOfItems = 0
    
    init() {
        basketItems = [
            .init(product: .init(name: "Jerseykleid", priceInCents: 2499), amount: 2),
            .init(product: .init(name: "High top Sneaker", priceInCents: 2499), amount: 3)
        ]
    }
    
    func remove(item: BasketItem) {
        for i in 0 ..< basketItems.count {
            if item == basketItems[i] {
                basketItems.remove(at: i)
                return
            }
        }
    }
    
    func clearBasket() {
        basketItems = []
    }
}
