//
//  ServerCommunication.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 19.08.22.
//

import Foundation
import Combine

protocol ServerCommunicationProtocol {
    func fetchAssortments(completion: @escaping (_ categories: [Category]) -> ())
}

class ServerCommunication: ServerCommunicationProtocol {
    static let navigationUrl = "https://codechallenge.mobilelab.io/v1/bonprix/navigation"
    
    var xApiKey: String = "REPLACEME"
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchAssortments(completion: @escaping (_ categories: [Category]) -> ()) {
        guard let url = URL(string: ServerCommunication.navigationUrl),
              xApiKey != "REPLACEME" else { return }
        
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(xApiKey, forHTTPHeaderField: "x-api-key")
        
        URLSession
            .shared
            .dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .map{$0.data}
            .decode(type: CategoryWrapper.self, decoder: JSONDecoder())
            .sink { receiveValue in
            } receiveValue: { wrapper in
                completion(wrapper.categories)
            }
            .store(in: &cancellables)
    }
}
