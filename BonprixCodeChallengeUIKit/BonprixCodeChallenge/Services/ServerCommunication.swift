//
//  ServerCommunication.swift
//  BonprixCodeChallenge
//
//  Created by Hannes Kühnel on 18.08.22.
//

import Foundation

protocol ServerCommunicationProtocol {
    func fetchAssortments(completion: @escaping (_ categories: [Category]) -> ())
}

class ServerCommunication: ServerCommunicationProtocol {
    static let navigationUrl = "https://codechallenge.mobilelab.io/v1/bonprix/navigation"
    var xApiKey: String? = "REPLACEME"
    
    func fetchAssortments(completion: @escaping (_ categories: [Category]) -> ()) {
        guard let url = URL(string: ServerCommunication.navigationUrl),
            xApiKey != "REPLACEME" else { return }

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(xApiKey, forHTTPHeaderField: "x-api-key")
        
        URLSession
            .shared
            .dataTask(with: request) { (data, _, _) in
                guard let data = data,
                     let categoryWrapper = try? JSONDecoder().decode(CategoryWrapper.self, from: data) else {
                    debugPrint("error loading: \(url.absoluteString)")
                    completion([])
                    return
                }
                completion(categoryWrapper.categories)
            }
            .resume()
    }
}
