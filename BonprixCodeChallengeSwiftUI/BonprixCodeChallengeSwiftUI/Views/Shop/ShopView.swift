//
//  ShopView.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 19.08.22.
//

import SwiftUI

struct ShopView: View {
    // MARK: - body
    var body: some View {
        NavigationView {
            WebView(urlAsString: "https://www.bonprix.de")
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Group {
                                Text("bon")
                                    .padding(.top, 16)
                                Text("prix")
                            }
                            .bonprixRedText()

                            ZStack {
                                Color.white
                                    .padding(.horizontal, -32)
                                    .padding(.bottom, -4)
                                SearchBar()
                            }
                        }
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
