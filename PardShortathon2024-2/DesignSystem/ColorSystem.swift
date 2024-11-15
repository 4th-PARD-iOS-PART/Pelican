//
//  ColorSystem.swift
//  PardShortathon2024-2
//
//  Created by KimDogyung on 11/15/24.
//

import UIKit

extension UIColor {
    // Custom initializer with individual red, green, blue, and alpha components
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        assert(alpha >= 0.0 && alpha <= 1.0, "Invalid alpha component")
        
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: alpha
        )
    }
    
    // Custom initializer with RGB hex value and alpha
    convenience init(rgb: Int, alpha: CGFloat) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            alpha: alpha
        )
    }
    
    // MARK: - Design System Color Definitions
    
    static var background: UIColor {
        return UIColor(rgb: 0xfff4f4ff, alpha: 1.0)
    }
    
    static var primary: UIColor {
        return UIColor(rgb: 0xfff35e3e, alpha: 1.0)
    }
    
    static var secondary: UIColor {
        return UIColor(rgb: 0xff239f95, alpha: 1.0)
    }
    
    static var textBlack: UIColor {
        return UIColor(rgb: 0xff2b2b2b, alpha: 1.0)
    }
}
