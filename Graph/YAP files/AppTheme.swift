//
//  AppTheme.swift
//  YAPKit
//
//  Created by Zain on 17/06/2019.
//  Copyright © 2019 YAP. All rights reserved.
//

import Foundation


public enum AppColorTheme {
    case yap
    case household
}

public enum AppFontTheme {
    case main
}

public class AppTheme {
    
    public static let shared = AppTheme(colorTheme: .yap, fontTheme: .main)
    
    public var colorTheme: AppColorTheme!
    public var fontTheme: AppFontTheme!
    
    
    
    private init(colorTheme: AppColorTheme, fontTheme: AppFontTheme) {
        self.colorTheme = colorTheme
        self.fontTheme = fontTheme
        
      
    }
    
    public func setThemes(colorTheme: AppColorTheme, fontTheme: AppFontTheme) {
        self.colorTheme = colorTheme
        self.fontTheme = fontTheme
    }
}
