//
//  BonprixCodeChallengeTests.swift
//  BonprixCodeChallengeTests
//
//  Created by Hannes Kühnel on 17.08.22.
//

import XCTest
@testable import BonprixCodeChallengeUIKit

class BonprixCodeChallengeTests: XCTestCase {
    private var categories: [BonprixCodeChallengeUIKit.Category] = []
    
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

    func testListViewModel() throws {
        let listViewModel = ListViewModel()
        
        XCTAssertEqual(listViewModel.numberOfSubcategories, 0)
        XCTAssertEqual(listViewModel.image, nil)
        XCTAssertEqual(listViewModel.label, nil)

        listViewModel.setCategory(categories[1])
        
        XCTAssertEqual(listViewModel.numberOfSubcategories, 2)
        XCTAssertEqual(listViewModel.image, "https://image01.bonprix.de/bonprixbilder/teaser/app/channels/app-dez-19a.jpg")
        XCTAssertEqual(listViewModel.label, "Damen")
        XCTAssertEqual(listViewModel.subcategory(at: 0).label, "Zur Übersicht")
        XCTAssertEqual(listViewModel.subcategory(at: 1).label, "Mode")
        
    }
    
    func testAssortmentViewModel() throws {
        let apiMock = MockServerCommunication()
        apiMock.categories = categories
        
        let assortmentViewModel = AssortmentViewModel(serverCommunication: apiMock)
        
        assortmentViewModel.delegate = AssortmentViewDelegateMock()
        
        XCTAssert(!assortmentViewModel.title.isEmpty)
        
        XCTAssertEqual(assortmentViewModel.numberOfCategories, 0)
        
        let defaultCategory = assortmentViewModel.category(at: assortmentViewModel.numberOfCategories + 1)
        
        XCTAssertEqual(defaultCategory.label, Category.default.label)
        XCTAssertEqual(defaultCategory.url, Category.default.url)
        XCTAssertEqual(defaultCategory.image, Category.default.image)
        XCTAssertEqual(defaultCategory.children?.count, Category.default.children?.count)
        
        assortmentViewModel.loadAssortments()
        
        let loadedCategory = assortmentViewModel.category(at: 0)
        
        XCTAssertEqual(loadedCategory, categories[1])
        XCTAssertEqual(defaultCategory.url, Category.default.url)
        XCTAssertEqual(defaultCategory.image, Category.default.image)
        XCTAssertEqual(defaultCategory.children?.count, Category.default.children?.count)
    }
}

struct AssortmentViewDelegateMock: AssortmentViewDelegate {
    func reload() {
        XCTAssert(true)
    }
}
