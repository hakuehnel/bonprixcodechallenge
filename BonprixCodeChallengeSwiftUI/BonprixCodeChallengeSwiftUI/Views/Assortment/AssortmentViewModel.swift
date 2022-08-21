//
//  AssortmentViewModel.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 19.08.22.
//

import Foundation
import Combine
import SwiftUI

final class AssortmentViewModel: ObservableObject {
    // MARK: - services
    private var api: ServerCommunicationProtocol
    
    // MARK: - published properties
    @Published private(set) var allCategories: [Category] = []
    @Published var selectedCategory: Category = Category.default
    
    init(serverCommunication: ServerCommunicationProtocol) {
        api = serverCommunication
    }
    
    func loadAssortments() {
        guard allCategories.count == 0 else { return }
        
        api.fetchAssortments { [weak self] categories in
            DispatchQueue.main.async {
                let filteredCategories = Array(categories.dropFirst())
                
                if let selectableCategory = filteredCategories.first {
                    self?.selectedCategory = selectableCategory
                }
                self?.allCategories = filteredCategories
            }
        }
    }
}
