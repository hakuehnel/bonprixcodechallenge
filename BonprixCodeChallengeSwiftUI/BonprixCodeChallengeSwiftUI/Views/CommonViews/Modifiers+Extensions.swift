//
//  Modifiers+Extensions.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 19.08.22.
//

import SwiftUI

struct BonprixTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.bonprixRegular)
    }
}
struct BonprixRedText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.bonprixMedium)
            .foregroundColor(.bonprixRed)
    }
}

extension View {
    func bonprixRegularText() -> some View {
        modifier(BonprixTextModifier())
    }
    func bonprixRedText() -> some View {
        modifier(BonprixRedText())
    }
}

extension Int {
    func priceFormatted() -> String {
        return String(format: "€ %.02f", Float(self) / 100)
    }
}
