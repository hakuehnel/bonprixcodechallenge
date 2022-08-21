//
//  Category.swift
//  BonprixCodeChallenge
//
//  Created by Hannes Kühnel on 17.08.22.
//

import Foundation

struct Category: Codable, Equatable {
    let label: String?
    let url: String?
    let image: String?
    let children: [Category]?
    
    static let `default` = Category(label: nil, url: nil, image: nil, children: nil)
}
