//
//  CGFloat+extension.swift
//  YAPKit
//
//  Created by Jawad Ali on 06/08/2020.
//  Copyright © 2020 YAP. All rights reserved.
//

import UIKit
public extension CGFloat {
    
    func deg2rad() -> CGFloat {
        return self * .pi / 180
    }
    
    func between(a: CGFloat, b: CGFloat) -> Bool {
        return self >= Swift.min(a, b) && self <= Swift.max(a, b)
    }
}
