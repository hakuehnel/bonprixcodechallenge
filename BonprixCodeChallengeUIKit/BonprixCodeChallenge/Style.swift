//
//  Extensions.swift
//  BonprixCodeChallenge
//
//  Created by Hannes Kühnel on 17.08.22.
//

import UIKit

// some bonprix-similar fonts and colors

extension UIFont {
    static let ubuntuRegular = UIFont(name: "Ubuntu-Regular", size: UIFont.labelFontSize)
    
    static let ubuntuMedium = UIFont(name: "Ubuntu-Medium", size: UIFont.labelFontSize)
    
    static let ubuntuBold = UIFont(name: "Ubuntu-Bold", size: UIFont.labelFontSize)
}

extension UIColor {
    // used from the cookie-banner on the website
    static let bonprixRed: UIColor = .init(red: 210/255, green: 25/255, blue: 41/255, alpha: 1)
    
    static let bonprixGray: UIColor = .init(red: 120/255, green: 120/255, blue: 120/255, alpha: 1)
    
    static let bonprixBackgroundColor: UIColor = .white
}
