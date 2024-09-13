//
//  UIColor.swift
//  Hired Valley
//
//  Created by ellkaden on 10.09.2024.
//

import UIKit

extension UIColor{
    
    static let appPurple10 = color(named: "Purple10")
    static let appPurple20 = color(named: "Purple20")
    static let appBlack10 = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255, alpha: 0)
    static let appBlue10 = color(named: "Blue10")
    static let appPurple30 = color(named: "Purple30")
    static let appWhite72 = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.72)
    static let appGray = color(named: "Grey10")
    static let appGray20 = color(named: "Grey20")
    static let appBlue20 = color(named: "Blue20")
    static let appBlack30 = color(named: "Black20")
    static let appPurple40 = color(named: "Purple40")
    static let appWhite64 = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.64)
    static let appPurple50 = color(named: "Purple50")
    static let appBlue30 = color(named: "Blue30")

    private static func color(named name: String) -> UIColor {
        guard let color = UIColor(named: name) else {
            fatalError("Unable to find a color named \(name)!")
        }
        return color
    }
    
    static func appBlack10(withOpacity opacity: CGFloat = 1.0) -> UIColor {
            return UIColor(named: "appDark90")?.withAlphaComponent(opacity) ?? .clear
        }
}
