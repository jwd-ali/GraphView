//
//  UIColor+Extenstions.swift
//  YAPKit
//
//  Created by Zain on 17/06/2019.
//  Copyright © 2019 YAP. All rights reserved.
//

import UIKit

public enum AppColorType {
    case primary
    case primaryDark
    case primaryLight
    case primarySoft
    case primaryAlt
    case grey
    case greyDark
    case greyLight
    case success
    case warning
    case error
    case secondaryBlue
    case secondaryOrange
    case secondaryGreen
    case secondaryMagenta
    case white
    case black
    case separatorGrey
    case initials
    case tableViewCellGreen
    case iconHolder
    case icon
}

public extension UIColor {
    static func appColor(ofType colorType: AppColorType, forTheme theme: AppColorTheme = AppTheme.shared.colorTheme) -> UIColor {
        
        switch (theme, colorType) {
        case (.yap, .primary):                  return #colorLiteral(red: 0.368627451, green: 0.2078431373, blue: 0.6941176471, alpha: 1)
        case (.yap, .primaryLight):             return #colorLiteral(red: 0.4862745098, green: 0.3019607843, blue: 1, alpha: 1)
        case (.yap, .primaryDark):              return #colorLiteral(red: 0.1529999971, green: 0.1330000013, blue: 0.3840000033, alpha: 1)
        case (.yap, .primarySoft):              return #colorLiteral(red: 0.6509803922, green: 0.5098039216, blue: 1, alpha: 1)
        case (.yap, .primaryAlt):               return #colorLiteral(red: 0.7329999804, green: 0.2590000033, blue: 0.9219999909, alpha: 1)
        case (.yap, .grey):                     return #colorLiteral(red: 0.7879999876, green: 0.7839999795, blue: 0.8470000029, alpha: 1)
        case (.yap, .greyLight):                return #colorLiteral(red: 0.8549019608, green: 0.878000021, blue: 0.9409999847, alpha: 1)
        case (.yap, .greyDark):                 return #colorLiteral(red: 0.5759999752, green: 0.5690000057, blue: 0.6940000057, alpha: 1)
        case (.yap, .success):                  return #colorLiteral(red: 0.2669999897, green: 0.8270000219, blue: 0.5370000005, alpha: 1)
        case (.yap, .warning):                  return #colorLiteral(red: 1, green: 0.7689999938, blue: 0.1879999936, alpha: 1)
        case (.yap, .error):                    return #colorLiteral(red: 1, green: 0.2310000062, blue: 0.1879999936, alpha: 1)
        case (.yap, .secondaryBlue):            return #colorLiteral(red: 0.2784313725, green: 0.5529411765, blue: 0.9568627451, alpha: 1)
        case (.yap, .secondaryOrange):          return #colorLiteral(red: 0.9607843137, green: 0.4980392157, blue: 0.09019607843, alpha: 1)
        case (.yap, .secondaryGreen):           return #colorLiteral(red: 0, green: 0.7254901961, blue: 0.6823529412, alpha: 1)
        case (.yap, .secondaryMagenta):         return #colorLiteral(red: 0.9568627451, green: 0.2784313725, blue: 0.4549019608, alpha: 1)
        case (.yap, .white):                    return .white
        case (.yap, .black):                    return .black
        case (.yap, .separatorGrey):            return #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        case (.yap, .initials):                 return #colorLiteral(red: 0.4862745098, green: 0.3019607843, blue: 1, alpha: 1)
        case (.yap, .tableViewCellGreen):       return #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9882352941, alpha: 1)
        case (.yap, .iconHolder):               return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        case (.yap, .icon):                     return #colorLiteral(red: 0.368627451, green: 0.2078431373, blue: 0.6941176471, alpha: 1)
        case (.household, .primary):            return #colorLiteral(red: 0.9882352941, green: 0.3843137255, blue: 0.3254901961, alpha: 1)
        case (.household, .primaryLight):       return #colorLiteral(red: 0.4862745098, green: 0.3019607843, blue: 1, alpha: 1)
        case (.household, .primaryDark):        return #colorLiteral(red: 0.1019607843, green: 0.07843137255, blue: 0, alpha: 1)
        case (.household, .primarySoft):        return #colorLiteral(red: 0.9803921569, green: 0.8941176471, blue: 0.8823529412, alpha: 1)
        case (.household, .primaryAlt):         return #colorLiteral(red: 0.7329999804, green: 0.2590000033, blue: 0.9219999909, alpha: 1)
        case (.household, .grey):               return #colorLiteral(red: 0.7879999876, green: 0.7839999795, blue: 0.8470000029, alpha: 1)
        case (.household, .greyLight):          return #colorLiteral(red: 0.8549019608, green: 0.878000021, blue: 0.9409999847, alpha: 1)
        case (.household, .greyDark):           return #colorLiteral(red: 0.5759999752, green: 0.5690000057, blue: 0.6940000057, alpha: 1)
        case (.household, .success):            return #colorLiteral(red: 0.2669999897, green: 0.8270000219, blue: 0.5370000005, alpha: 1)
        case (.household, .warning):            return #colorLiteral(red: 1, green: 0.7689999938, blue: 0.1879999936, alpha: 1)
        case (.household, .error):              return #colorLiteral(red: 1, green: 0.2310000062, blue: 0.1879999936, alpha: 1)
        case (.household, .secondaryBlue):      return #colorLiteral(red: 0.2784313725, green: 0.5529411765, blue: 0.9568627451, alpha: 1)
        case (.household, .secondaryOrange):    return #colorLiteral(red: 0.9607843137, green: 0.4980392157, blue: 0.09019607843, alpha: 1)
        case (.household, .secondaryGreen):     return #colorLiteral(red: 0, green: 0.7254901961, blue: 0.6823529412, alpha: 1)
        case (.household, .secondaryMagenta):   return #colorLiteral(red: 0.9568627451, green: 0.2784313725, blue: 0.4549019608, alpha: 1)
        case (.household, .white):              return .white
        case (.household, .black):              return .black
        case (.household, .separatorGrey):      return #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        case (.household, .initials):           return #colorLiteral(red: 0.4862745098, green: 0.3019607843, blue: 1, alpha: 1)
        case (.household, .tableViewCellGreen): return #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9882352941, alpha: 1)
        case (.household, .iconHolder):         return #colorLiteral(red: 0.9882352941, green: 0.3843137255, blue: 0.3254901961, alpha: 1)
        case (.household, .icon):               return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    static var primary: UIColor {
        return appColor(ofType: .primary)
    }
    
    static var primaryLight: UIColor {
        return appColor(ofType: .primaryLight)
    }
    
    static var primaryDark: UIColor {
        return appColor(ofType: .primaryDark)
    }
    
    static var primarySoft: UIColor {
        return appColor(ofType: .primarySoft)
    }
    
    static var primaryAlt: UIColor {
        return appColor(ofType: .primaryAlt)
    }
    
    static var grey: UIColor {
        return appColor(ofType: .grey)
    }
    
    static var greyDark: UIColor {
        return appColor(ofType: .greyDark)
    }
    
    static var greyLight: UIColor {
        return appColor(ofType: .greyLight)
    }
    
    static var success: UIColor {
        return appColor(ofType: .success)
    }
    
    static var warning: UIColor {
        return appColor(ofType: .warning)
    }
    
    static var error: UIColor {
        return appColor(ofType: .error)
    }
    
    static var secondaryBlue: UIColor {
        return appColor(ofType: .secondaryBlue)
    }
    
    static var secondaryGreen: UIColor {
        return appColor(ofType: .secondaryGreen)
    }
    
    static var secondaryOrange: UIColor {
        return appColor(ofType: .secondaryOrange)
    }
    
    static var secondaryMagenta: UIColor {
        return appColor(ofType: .secondaryMagenta)
    }
    
    static var initials: UIColor {
        return appColor(ofType: .initials)
    }
    
    static var cell: UIColor {
        return appColor(ofType: .tableViewCellGreen)
    }
    
    static var icon: UIColor {
        return appColor(ofType: .icon)
    }
    
    static var iconHolder: UIColor {
        return appColor(ofType: .iconHolder)
    }
    
}

public extension UIColor {
    func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }
    
    func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    
    func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
}

public extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

// MARK: Image creation from color

public extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}

public extension UIColor {
    static var  householdBackgroundColor: UIColor {
        return UIColor(red: 250/255, green: 228/255, blue: 225/255, alpha: 1.0)
    }
}

public extension UIColor {
 
    
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}

