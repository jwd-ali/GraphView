//
//  RateView.swift
//  Graph
//
//  Created by Jawad Ali on 03/08/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import UIKit
@IBDesignable
public class RateView: UIView {
    
    //MARK:- Views
    
    private lazy var headerView: RateHeaderView = {
        
        let exchangeData = exData?.exchangeCurrecncy
        let header = RateHeaderView(maximumValue:exchangeData?.max()?.currencyRate ?? 0 , minimumValue: exchangeData?.min()?.currencyRate ?? 0, currentVal: exchangeData?.last?.currencyRate ?? 0)
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
        
    }()
    
    private lazy var graphView: GraphView = {
        let graph = GraphView(self.exData)
        graph.translatesAutoresizingMaskIntoConstraints = false
        return graph
    }()
    
    private lazy var footerView: RateFooterViw = {
        let footer = RateFooterViw(minimumDate: exData?.exchangeCurrecncy.first?.convertTime ?? "", maximumDate: exData?.exchangeCurrecncy.last?.convertTime ?? "")
        footer.translatesAutoresizingMaskIntoConstraints = false
        return footer
    }()
    
    
    //MARK:- Properties
    private var exData: Exchange?
    
    
    //MARK:- initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    public init(exchangeData:Exchange? ) {
        super.init(frame: .zero)
        exData = exchangeData
        commonInit()
        
    }
    
    private func commonInit() {
        
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.15
        layer.cornerRadius = 8
        
        setupView()
        bindViews()
    }
    
    private func setupView() {
        addSubview(headerView)
        addSubview(graphView)
        addSubview(footerView)
    }
    
    private func bindViews(){
        headerView
            .alignEdgesWithSuperview([.top, .left, .right])
            .height(constant: 70)
        
        graphView
            .toBottomOf(headerView)
            .alignEdgesWithSuperview([.right, .left])
            .height(.lessThanOrEqualTo, constant: 350)
        
        footerView
            .toBottomOf(graphView, constant:15)
            .alignEdgesWithSuperview([.left, .right], constant:14)
            .height(constant: 35)
            .alignEdgeWithSuperview(.bottom)
        
        
    }
}
