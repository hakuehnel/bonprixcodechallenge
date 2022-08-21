//
//  Style.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 19.08.22.
//

import SwiftUI

// some bonprix-similar fonts and colors

extension Font {
    static var bonprixMedium = Font.custom("Ubuntu-Medium", size: 16)
    static var bonprixRegular = Font.custom("Ubuntu-Regular", size: 16)
}

extension UIColor {
    static let bonprixRed: UIColor = .init(red: 210/255, green: 25/255, blue: 41/255, alpha: 1)
}

extension ShapeStyle where Self == Color  {
    // used from the cookie-banner on the website
    static var bonprixRed: Color {
        .init(red: 210/255, green: 25/255, blue: 41/255)
    }
    
    static var bonprixGray: Color {
        .init(red: 120/255, green: 120/255, blue: 120/255)
    }
    
    static var bonprixBackgroundColor: Color {
        .white
    }
    
    static var searchBarBackground: Color {
        .init(red: 243/255, green: 241/255, blue: 244/255)
    }
    
    static var searchBarTintColor: Color {
        .init(red: 150/255, green: 148/255, blue: 152/255)
    }
    
    static var backgroundGray: Color {
        .init(red: 248/255, green: 248/255, blue: 248/255)
    }
}
