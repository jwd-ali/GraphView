//
//  RatesView.swift
//  Graph
//
//  Created by Jawad Ali on 03/08/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import UIKit
@IBDesignable
final class RateHeaderView: UIView {
    
    // MARK: Views
    
    private lazy var horizantalStackView = UIStackViewFactory.createStackView(with: .horizontal, alignment: .center, distribution: .fill, spacing: 0, arrangedSubviews: [lowestStack, currentStack, highestStack])
    
    private lazy var lowestStack = UIStackViewFactory.createStackView(with: .vertical, alignment: .leading, distribution: .fillEqually, spacing: 0, arrangedSubviews: [lowestValueLabel, lowestLabel])
    
    private lazy var currentStack = UIStackViewFactory.createStackView(with: .vertical, alignment: .center, distribution: .fillEqually, spacing: 0, arrangedSubviews: [currentValueLabel, currentLabel])
    
    private lazy var highestStack = UIStackViewFactory.createStackView(with: .vertical, alignment: .trailing, distribution: .fillEqually, spacing: 0, arrangedSubviews: [highestValueLabel, highestLabel])
    
    private lazy var lowestLabel = UILabelFactory.createUILabel(with: .grey, textStyle: .micro, alignment: .left
        , text: "Lowest")
    
    private lazy var currentLabel = UILabelFactory.createUILabel(with: .grey, textStyle: .micro, alignment: .center
        , text: "Current")
    
    private lazy var highestLabel = UILabelFactory.createUILabel(with: .greyDark, textStyle: .micro, alignment: .right
        , text: "Highest")
    
    private lazy var lowestValueLabel = UILabelFactory.createUILabel(with: .primaryDark, textStyle: .micro, alignment: .left
        , text: "2.7175")
    
    private lazy var currentValueLabel = UILabelFactory.createUILabel(with: .secondaryGreen, textStyle: .micro, alignment: .center
        , text: "+(0.0003%) 2.7177")
    
    private lazy var highestValueLabel = UILabelFactory.createUILabel(with: .primaryDark, textStyle: .micro, alignment: .right
        , text: "2.7525")
    
    
    //MARK:- initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    public convenience init(maximumValue: Double, minimumValue: Double, currentVal: Double) {
        self.init(frame: .zero)
        
        set(maximumValue: maximumValue, minimumValue: minimumValue, currentVal: currentVal)
    }
    
    private func commonInit(){
        lowestLabel.textColor = UIColor.greyDark.withAlphaComponent(0.5)
        highestLabel.textColor = UIColor.greyDark.withAlphaComponent(0.5)
        currentLabel.textColor = UIColor.greyDark.withAlphaComponent(0.5)
        
        setupView()
        bindView()

    }
    
    //MARK:- Value Setters
    public func set(maximumValue: Double, minimumValue: Double, currentVal: Double) {
        
        self.highestValueLabel.text =  String(format: "%.2f", maximumValue)
        self.lowestValueLabel.text = String(format: "%.2f", minimumValue)
        self.currentValueLabel.text = "+(0.0003%) \( String(format: "%.2f", currentVal)) "
    }
    
    private func setupView() {
        addSubview(horizantalStackView)
    }
    
    private func bindView() {
        horizantalStackView
            .alignEdgesWithSuperview([.right, .left, .top], constant: 25)
            .alignEdgeWithSuperview(.bottom, constant: 10)
    }
    
}
