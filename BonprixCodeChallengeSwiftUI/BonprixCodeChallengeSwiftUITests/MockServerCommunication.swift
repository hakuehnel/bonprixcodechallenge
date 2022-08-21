//
//  MockServerCommunication.swift
//  BonprixCodeChallengeTests
//
//  Created by Hannes Kühnel on 19.08.22.
//

import Foundation
@testable import BonprixCodeChallengeSwiftUI

final class MockServerCommunication: ServerCommunicationProtocol {
    var categories: [BonprixCodeChallengeSwiftUI.Category] = []
    func fetchAssortments(completion: @escaping ([BonprixCodeChallengeSwiftUI.Category]) -> ()) {
        completion(categories)
    }
}
