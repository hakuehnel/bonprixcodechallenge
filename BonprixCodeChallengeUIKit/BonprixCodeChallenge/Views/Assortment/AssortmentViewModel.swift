//
//  AssortmentViewModel.swift
//  BonprixCodeChallenge
//
//  Created by Hannes Kühnel on 18.08.22.
//

import Resolver

protocol AssortmentViewDelegate {
    func reload()
}

final class AssortmentViewModel {
    private var api: ServerCommunicationProtocol
    private var categories: [Category] = []
    
    var delegate: AssortmentViewDelegate?
    
    var title: String {
        return "Sortiment"
    }
    
    var numberOfCategories: Int {
        // ignore first entry containing the bonprix start page
        return max(0, categories.count - 1)
    }
    
    init(serverCommunication: ServerCommunicationProtocol) {
        api = serverCommunication
    }
    
    func category(at index: Int) -> Category {
        guard categories.count > index + 1 else { return Category.default }
        
        // ignore first entry containing the bonprix start page
        return categories[index + 1]
    }
    
    func loadAssortments() {
        guard categories.count == 0 else { return }
        
        api.fetchAssortments { [weak self] categories in
            self?.categories = categories
            self?.delegate?.reload()
        }
    }
}
