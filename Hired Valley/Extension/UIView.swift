//
//  UIView.swift
//  Hired Valley
//
//  Created by ellkaden on 10.09.2024.
//

import UIKit

extension UIView {
    func setGradientBackground(purpleColors: [CGColor], blackColors: [CGColor]? = nil) {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = self.bounds
            gradientLayer.colors = purpleColors
            gradientLayer.locations = [0, 1]
            self.layer.addSublayer(gradientLayer)
            
            if let blackColors = blackColors {
                self.addBlackGradient(colors: blackColors)
            }
        }

        private func addBlackGradient(colors: [CGColor]) {
            let gradientLayer = CAGradientLayer()

            let screenHeight = self.bounds.height
            let screenWidth = self.bounds.width

            gradientLayer.frame = CGRect(x: 0, y: screenHeight / 2, width: screenWidth, height: screenHeight / 2)
            gradientLayer.colors = colors
            gradientLayer.locations = [0, 1]
            
            self.layer.addSublayer(gradientLayer)
        }
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}
