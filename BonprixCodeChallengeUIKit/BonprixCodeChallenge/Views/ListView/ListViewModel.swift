//
//  ListViewModel.swift
//  BonprixCodeChallenge
//
//  Created by Hannes Kühnel on 18.08.22.
//

import Foundation

class ListViewModel {
    private var category: Category?
    
    private var subcategories: [Category] {
        return category?.children ?? []
    }
    
    // MARK: - public getters
    var label: String? {
        return category?.label
    }
    
    var image: String? {
        return category?.image
    }
    
    var numberOfSubcategories: Int {
        return subcategories.count
    }
    
    func setCategory(_ category: Category) {
        self.category = category
    }
    
    func subcategory(at index: Int) -> Category {
        return subcategories[index]
    }
}
