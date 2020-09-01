//
//  UIRoundedButtonFactory.swift
//  YAPKit
//
//  Created by Hussaan S on 26/07/2019.
//  Copyright © 2019 YAP. All rights reserved.
//

import UIKit

public class UIRoundedButtonFactory {
    
    public class func createUIRoundedButton(title: String = String(), backgroundColor: UIColor = UIColor.appColor(ofType: .primary), textColor: UIColor =  UIColor.appColor(ofType: .white), isEnable: Bool = true, icon: UIImage? = nil) -> UIRoundedButton {
        let button = UIRoundedButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(textColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.icon = icon
        button.iconPosition = .right
        button.isEnabled = isEnable
        return button
    }
}
