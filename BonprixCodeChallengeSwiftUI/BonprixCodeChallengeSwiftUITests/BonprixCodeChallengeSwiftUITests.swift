//
//  BonprixCodeChallengeSwiftUITests.swift
//  BonprixCodeChallengeSwiftUITests
//
//  Created by Hannes Kühnel on 19.08.22.
//

import XCTest
@testable import BonprixCodeChallengeSwiftUI

class BonprixCodeChallengeSwiftUITests: XCTestCase {
    private var categories: [BonprixCodeChallengeSwiftUI.Category] = []
    
    override func setUp() {
        super.setUp()
        
        guard
            let pathString = Bundle(for: type(of: self)).path(forResource: "TestData", ofType: "json"),
            let jsonString = try? String(contentsOfFile: pathString, encoding: .utf8),
            let jsonData = jsonString.data(using: .utf8)
            else { return }
        do {
            categories = try JSONDecoder().decode(CategoryWrapper.self, from: jsonData).categories
        } catch {
        }
    }
    
    func testAssortmentViewModel() throws {
        let apiMock = MockServerCommunication()
        apiMock.categories = categories
        
        let assortmentViewModel = AssortmentViewModel(serverCommunication: apiMock)
        
        
        XCTAssertEqual(assortmentViewModel.allCategories.count, 0)
        
        let defaultCategory = assortmentViewModel.selectedCategory
        
        XCTAssertEqual(defaultCategory.label, Category.default.label)
        XCTAssertEqual(defaultCategory.url, Category.default.url)
        XCTAssertEqual(defaultCategory.image, Category.default.image)
        XCTAssertEqual(defaultCategory.children?.count, Category.default.children?.count)
        
        assortmentViewModel.loadAssortments()
        
        assortmentViewModel.selectedCategory = categories[1]
        
        let loadedCategory = assortmentViewModel.selectedCategory
        
        XCTAssertEqual(loadedCategory, categories[1])
        XCTAssertEqual(defaultCategory.url, Category.default.url)
        XCTAssertEqual(defaultCategory.image, Category.default.image)
        XCTAssertEqual(defaultCategory.children?.count, Category.default.children?.count)
    }
    
    func testBasketViewModel() {
        let basketViewModel = BasketViewModel()
        
        
        basketViewModel.clearBasket()
        
        XCTAssertEqual(basketViewModel.basketItems.count, 0)
        XCTAssertEqual(basketViewModel.basketSum, 0)
        XCTAssertEqual(basketViewModel.numberOfItems, 0)
        
        basketViewModel.basketItems.append(.default)
        
        XCTAssertEqual(basketViewModel.basketItems.count, 1)
        XCTAssertEqual(basketViewModel.basketSum, BasketItem.default.amount * BasketItem.default.product.priceInCents)
        XCTAssertEqual(basketViewModel.numberOfItems, 1)
        
        basketViewModel.remove(item: .default)
        
        XCTAssertEqual(basketViewModel.basketItems.count, 0)
        
        
        basketViewModel.remove(item: .default)
        
        XCTAssertEqual(basketViewModel.basketItems.count, 0)
    }
}
