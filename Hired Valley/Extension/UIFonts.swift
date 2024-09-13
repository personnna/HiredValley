//
//  UIFonts.swift
//  Hired Valley
//
//  Created by ellkaden on 10.09.2024.
//

import Foundation
import UIKit

extension UIFont {
    enum FontWeight: String {
        case regular = "Regular"
        case extrabold = "Extrabold"
        case medium = "Medium"
        case semibold = "Semibold"
    }
    
    private static let appFontName = "Kontora"

    static func appFont(ofSize size: CGFloat, weight: FontWeight = .regular) -> UIFont {
        let fontName = "\(appFontName)-\(weight.rawValue)"
        guard let font = UIFont(name: fontName, size: size) else {
            fatalError("Unable to find a font named \(fontName)!")
        }

        return font
    }
}
