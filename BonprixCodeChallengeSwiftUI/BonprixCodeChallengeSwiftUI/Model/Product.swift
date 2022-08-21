//
//  Product.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 20.08.22.
//

import Foundation

struct Product {
    let name: String
    let priceInCents: Int
    
    static let `default` = Product(name: "Demo", priceInCents: 2499)
}
