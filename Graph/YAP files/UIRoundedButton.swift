//
//  UIRoundedButton.swift
//  YAPKit
//
//  Created by Wajahat Hassan on 18/06/2019.
//  Copyright © 2019 YAP. All rights reserved.
//

import UIKit

public enum UIRoundedButtonIconPosition {
    case right
    case left
}

/**
 Button with rounded edges to fit with YAP UI. Due to rounded edges and optional icon, smaller width cases should be handled with fix width constraint.
 */
@IBDesignable
public class UIRoundedButton: UIButton {
    
    // MARK: - Properties
    @IBInspectable
    public var icon: UIImage? {
        didSet {
            iconImageView.image = icon
            iconSize = icon?.size ?? .zero
            addIcon()
        }
    }
    
    public var iconSize: CGSize = CGSize.zero {
        didSet {
            positionIcon()
        }
    }
    
    public var titleColor: UIColor = .white {
        didSet {
            setTitleColor(titleColor, for: .normal)
        }
    }
    
    public var title: String? {
        didSet {
            if let t = title { setTitle(t, for: .normal) }
        }
    }
    
    public override var isEnabled: Bool {
        didSet {
            guard oldValue != isEnabled else { return }
            UIView.animate(withDuration: 0.3) { [unowned self] in
                self.alpha = self.isEnabled ? 1 : 0.3
            }
        }
    }
    
    @IBInspectable
    public var iconLeftOffset: CGFloat = 26 {
        didSet {
            positionIcon()
        }
    }
    
    @IBInspectable
    public var iconRightOffset: CGFloat = 17 {
        didSet {
            positionIcon()
        }
    }
    
    public var iconPosition: UIRoundedButtonIconPosition = .right {
        didSet {
            positionIcon()
        }
    }
    
    private var iconImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private var iconLeftConstraint: NSLayoutConstraint?
    private var iconRightConstraint: NSLayoutConstraint?
    private var iconWidthConstraint: NSLayoutConstraint?
    private var iconHeightConstraint: NSLayoutConstraint?
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        layoutIfNeeded()
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        style()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
    }
    
    private func style() {
        backgroundColor = .primary
        titleLabel?.textAlignment = .center
        titleLabel?.font = .appFont(forTextStyle: .large)
        titleLabel?.textColor = UIColor.white
    }
    
    private func addIcon() {
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.clipsToBounds = true
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.image = icon
        
        if !subviews.contains(iconImageView) {
            addSubview(iconImageView)
            iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        }
        updateIconConstraints()
    }
    
    private func updateIconConstraints() {
        iconLeftConstraint = iconImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: iconLeftOffset)
        iconRightConstraint = iconImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -iconRightOffset)
        iconWidthConstraint = iconImageView.widthAnchor.constraint(equalToConstant: iconSize.width)
        iconHeightConstraint = iconImageView.widthAnchor.constraint(equalToConstant: iconSize.height)
        iconWidthConstraint?.isActive = true
        iconHeightConstraint?.isActive = true
        positionIcon()
    }
    
    private func positionIcon() {
        iconWidthConstraint?.constant = iconSize.width
        iconHeightConstraint?.constant = iconSize.width
        if iconPosition == .left {
            iconLeftConstraint?.constant = iconLeftOffset
            iconLeftConstraint?.isActive = true
            iconRightConstraint?.isActive = false
        } else {
            iconRightConstraint?.constant = -iconRightOffset
            iconRightConstraint?.isActive = true
            iconLeftConstraint?.isActive = false
        }
    }
}
