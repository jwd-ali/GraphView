//
//  CGPoint+Extension.swift
//  YAPKit
//
//  Created by Jawad Ali on 06/08/2020.
//  Copyright © 2020 YAP. All rights reserved.
//

import UIKit
public extension CGPoint {
    func getNearestXIndex(from points: [CGPoint]) ->  Int? {
        if let (index, _) = points.map({ abs($0.x - self.x) }).enumerated().min(by: { $0.1 < $1.1 }) {
            return index
        }
        return nil
    }
}
