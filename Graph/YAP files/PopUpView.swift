//
//  PopUpView.swift
//  Graph
//
//  Created by Jawad Ali on 30/07/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import UIKit
@IBDesignable
public class PopUpView: UIView {
    
    // MARK: Views
    
    private lazy var dateLabel = UILabelFactory.createUILabel(with: .greyDark, textStyle: .micro, alignment: .center)
    
    private lazy var valueLabel =  UILabelFactory.createUILabel(with: .primaryDark, textStyle: .micro, alignment: .center)
    
    private lazy var stack = UIStackViewFactory.createStackView(with: .vertical, alignment: .center, distribution: .fillEqually, spacing: 2, arrangedSubviews: [dateLabel, valueLabel])
    
    private lazy var triangleLayer : CAShapeLayer = {
        let shape = CAShapeLayer()
        shape.fillColor = UIColor.white.cgColor
        shape.anchorPoint = .zero
        return shape
    }()
    
    // MARK: Public Properties
    
    public  var cornerRadius: CGFloat = 4 {
        didSet{
            setNeedsLayout()
        }
    }
    
    public var arrowHeight: CGFloat = 7 {
        didSet{
            setNeedsLayout()
        }
    }
    
    public var arrowXOffset: CGFloat = 0 {
        didSet {
            if self.arrowXOffset < cornerRadius/2 {
                
                self.arrowXOffset = cornerRadius/2
            } else if arrowXOffset > (self.bounds.maxX - arrowHeight * 2) {
                
                arrowXOffset = self.bounds.maxX - arrowHeight * 2
            }

            setNeedsLayout()
        }
    }

    //MARK:- initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        setupView()
        bindViews()
        
    }
    
     //MARK:- View life cycle
    
    override public func layoutSubviews() {
         super.layoutSubviews()
        self.triangleLayer.path = self.getBezierPath().cgPath
    }
    
    //MARK:- SetupView
    
    private func setupView() {
        layer.shadowRadius = 7
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.25
        
        layer.addSublayer(triangleLayer)
        addSubview(stack)
        
    }
    
    private func bindViews() {
        stack.centerYAnchor.constraint(equalTo: self.centerYAnchor,constant: -4).isActive = true
        stack.leftAnchor.constraint(equalTo: self.leftAnchor, constant:0).isActive = true
        stack.rightAnchor.constraint(equalTo: self.rightAnchor, constant:0).isActive = true
    }
    
    public func configure(value:String , dateString: String) {
        dateLabel.text = dateString
        valueLabel.text = value
    }
    
    public func setMidleAnchor(){
        arrowXOffset = self.bounds.midX - self.arrowHeight
    }
}

//MARK: - Drawing UIBzierPaths

extension PopUpView {
    
    private func getBezierPath()-> UIBezierPath {
        
        let mainRect = CGRect(origin: bounds.origin, size: CGSize(width: bounds.width, height: bounds.height - arrowHeight))
        
        let leftTopPoint = mainRect.origin
        let rightTopPoint = CGPoint(x: mainRect.maxX, y: mainRect.minY)
        let rightBottomPoint = CGPoint(x: mainRect.maxX, y: mainRect.maxY)
        let leftBottomPoint = CGPoint(x: mainRect.minX, y: mainRect.maxY)
        
        let leftArrowPoint = CGPoint(x: leftBottomPoint.x + arrowXOffset, y: leftBottomPoint.y)
        let centerArrowPoint = CGPoint(x: leftArrowPoint.x + arrowHeight, y: leftArrowPoint.y + arrowHeight)
        let rightArrowPoint = CGPoint(x: leftArrowPoint.x + 2 * arrowHeight, y: leftArrowPoint.y)
        
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: rightTopPoint.x - cornerRadius, y: rightTopPoint.y + cornerRadius), radius: cornerRadius,
                    startAngle: CGFloat(3 * Double.pi / 2), endAngle: CGFloat(2 * Double.pi), clockwise: true)
        path.addArc(withCenter: CGPoint(x: rightBottomPoint.x - cornerRadius, y: rightBottomPoint.y - cornerRadius), radius: cornerRadius,
                    startAngle: 0, endAngle: CGFloat(Double.pi / 2), clockwise: true)
        
        path.addLine(to: rightArrowPoint)
        path.addLine(to: centerArrowPoint)
        path.addLine(to: leftArrowPoint)
        
        path.addArc(withCenter: CGPoint(x: leftBottomPoint.x + cornerRadius, y: leftBottomPoint.y - cornerRadius), radius: cornerRadius,
                    startAngle: CGFloat(Double.pi / 2), endAngle: CGFloat(Double.pi), clockwise: true)
        path.addArc(withCenter: CGPoint(x: leftTopPoint.x + cornerRadius, y: leftTopPoint.y + cornerRadius), radius: cornerRadius,
                    startAngle: CGFloat(Double.pi), endAngle: CGFloat(3 * Double.pi / 2), clockwise: true)
        
        
        path.addLine(to: rightTopPoint)
        path.close()
        
        return path
    }
}
