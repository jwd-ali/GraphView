//
//  UILabelFactory.swift
//  YAPKit
//
//  Created by Hussaan S on 26/07/2019.
//  Copyright © 2019 YAP. All rights reserved.
//

import UIKit


public class UILabelFactory {

    public class func createUILabel<T: UILabel>(with colorType: AppColorType = .primary, textStyle: AppTextStyle = .title1, alignment: NSTextAlignment = .left, numberOfLines: Int = 1, lineBreakMode: NSLineBreakMode = .byTruncatingTail, text: String? = nil, alpha: CGFloat = 1.0) -> T {
        let label = T()
        label.font = UIFont.appFont(forTextStyle: textStyle)
        label.textColor = UIColor.appColor(ofType: colorType)
        label.textAlignment = alignment
        label.numberOfLines = numberOfLines
        label.lineBreakMode = lineBreakMode
        label.text = text
        label.alpha = alpha
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
