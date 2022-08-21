//
//  MockServerCommunication.swift
//  BonprixCodeChallengeTests
//
//  Created by Hannes Kühnel on 19.08.22.
//

import Foundation
@testable import BonprixCodeChallengeUIKit

final class MockServerCommunication: ServerCommunicationProtocol {
    var categories: [BonprixCodeChallengeUIKit.Category] = []
    
    func fetchAssortments(completion: @escaping ([BonprixCodeChallengeUIKit.Category]) -> ()) {
        completion(categories)
    }
}
