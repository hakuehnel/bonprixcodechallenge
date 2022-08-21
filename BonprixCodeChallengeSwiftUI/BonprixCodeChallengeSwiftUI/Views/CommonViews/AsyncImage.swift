//
//  AsyncImage.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 19.08.22.
//

import SwiftUI

struct AsyncImage: View {
    @StateObject var imageLoader: ImageLoader = ImageLoader()
    @State var image: UIImage = UIImage()
    
    private var urlString = ""

    init(withURL url: String) {
        urlString = url
    }

    // MARK: - body
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.size.width - 40, height: 200, alignment: .top)
            .clipped()
            .onAppear {
                imageLoader.loadImage(imageUrl: urlString) { data in
                    self.image = UIImage(data: data) ?? UIImage()
                }
            }
    }
}
