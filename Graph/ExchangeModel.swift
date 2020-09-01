//
//  ExchangeModel.swift
//  Graph
//
//  Created by Jawad Ali on 04/08/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import Foundation
// MARK: - Exchange
public struct Exchange: Decodable {
    let exchangeCurrecncy: [ExchangeCurrecncy]
    
    enum CodingKeys: String, CodingKey {
        case exchangeCurrecncy = "ExchangeCurrecncy"
    }
    
    static func mock()-> Exchange?{
        var data = [ExchangeCurrecncy]()
        
        for i in 0...30 {
            data.append(ExchangeCurrecncy(currencyRate: Double.random(in: 158...165.5), convertTime: "2019-04-\(i+1) 6:00PM"))
        }
        return Exchange(exchangeCurrecncy: data)
    }
}

// MARK: - ExchangeCurrecncy

public struct ExchangeCurrecncy : Decodable, Comparable {
    public static func < (lhs: ExchangeCurrecncy, rhs: ExchangeCurrecncy) -> Bool {
        lhs.currencyRate < rhs.currencyRate
    }
    
    let currencyRate: Double
    let convertTime: String
}
