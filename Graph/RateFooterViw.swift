//
//  RateFooterViw.swift
//  Graph
//
//  Created by Jawad Ali on 03/08/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import UIKit

final class RateFooterViw: UIView {
    
      // MARK: Views
    private lazy var horizantalStackView = UIStackViewFactory.createStackView(with: .horizontal, alignment: .center, distribution: .fillEqually, spacing: 0, arrangedSubviews: [minimumDateLabel, maximumDateLabel])
    
    private lazy var minimumDateLabel = UILabelFactory.createUILabel(with: .greyDark, textStyle: .micro, alignment: .center
        , text: "May 14, 2019 - 6:00PM")
    
    private lazy var maximumDateLabel = UILabelFactory.createUILabel(with: .greyDark, textStyle: .micro, alignment: .right
        , text: "Jun 14, 2019 - 6:00PM")
    
    
       //MARK:- initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    public convenience init(minimumDate: String, maximumDate : String) {
        self.init(frame: .zero)
        configure(minimumDate: minimumDate, maximumDate: maximumDate)
    }
    
    private func commonInit(){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        setupView()
        bindViwe()
        
    }
    
    private func setupView() {
        addSubview(horizantalStackView)
        
    }
    private func bindViwe() {
        
        horizantalStackView
            .alignEdgesWithSuperview([.left, .right, .top])
            .alignEdgeWithSuperview(.bottom, constant: 14 )
        
    }
    
    private func configure(minimumDate : String, maximumDate: String) {
        minimumDateLabel.text = minimumDate
        maximumDateLabel.text = maximumDate
    }
}
