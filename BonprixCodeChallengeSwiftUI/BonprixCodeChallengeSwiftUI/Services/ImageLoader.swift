//
//  ImageLoader.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 19.08.22.
//

import Foundation
import Combine

class ImageLoader: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    
    func loadImage(imageUrl: String, completion: @escaping (_ data: Data) -> ()) {
        if let url = URL(string: imageUrl) {
            URLSession
                .shared
                .dataTaskPublisher(for: url)
                .receive(on: DispatchQueue.main)
                .sink { receiveValue in
                } receiveValue: { data in
                    completion(data.data)
                }
                .store(in: &cancellables)
        }
    }
}
