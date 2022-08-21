//
//  Category.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 19.08.22.
//

import Foundation

struct Category: Codable, Hashable {
    let label: String
    let url: String?
    let image: String?
    let children: [Category]?
    
    static let `default` = Category(label: "Demo", url: nil, image: nil, children: nil)
}
