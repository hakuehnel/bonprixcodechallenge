//
//  BonprixCodeChallengeSwiftUIApp.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 19.08.22.
//

import SwiftUI

@main
struct BonprixCodeChallengeSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ShopView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Shop")
                    }
                    .tag(0)
                AssortmentView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Sortiment")
                    }
                    .tag(1)
                BasketView()
                    .tabItem {
                        Image(systemName: "bag")
                        Text("Einkaufstasche")
                    }
                    .tag(3)
                MyBonprix()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Mein bonprix")
                    }
                    .tag(4)
            }
            .accentColor(.bonprixRed)
            .navigationViewStyle(.stack)
        }
    }
}
