//  Viba
//  Created by Radhachandan Chilamkurthy

import UIKit

extension UIFont {
    static func tiny(family: AppFontName) -> UIFont {
        return UIFont(name: family.rawValue, size: AppFontSize.tiny.rawValue)!
    }

    static func mini(family: AppFontName) -> UIFont {
        return UIFont(name: family.rawValue, size: AppFontSize.mini.rawValue)!
    }

    static func small(family: AppFontName) -> UIFont {
        return UIFont(name: family.rawValue, size: AppFontSize.small.rawValue)!
    }

    static func medium(family: AppFontName) -> UIFont {
        return UIFont(name: family.rawValue, size: AppFontSize.medium.rawValue)!
    }

    static func large(family: AppFontName) -> UIFont {
        return UIFont(name: family.rawValue, size: AppFontSize.large.rawValue)!
    }

    static func xl(family: AppFontName) -> UIFont {
        return UIFont(name: family.rawValue, size: AppFontSize.xl.rawValue)!
    }

    static func xxl(family: AppFontName) -> UIFont {
        return UIFont(name: family.rawValue, size: AppFontSize.xxl.rawValue)!
    }

    static func xxxl(family: AppFontName) -> UIFont {
        return UIFont(name: family.rawValue, size: AppFontSize.xxxl.rawValue)!
    }
}

extension UIFont {
    static func printFonts() {
        for familyName in UIFont.familyNames {
            print("Font Family = \(familyName)")
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print(fontName)
            }
        }
    }
}
