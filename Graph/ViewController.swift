//
//  ViewController.swift
//  Graph
//
//  Created by Jawad Ali on 26/07/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mview: UIView!
    
    private lazy var alertButton: UIRoundedButton = UIRoundedButtonFactory.createUIRoundedButton(title: "Set alert", backgroundColor: .primary)
    
     private lazy var exchageButton: UIRoundedButton = UIRoundedButtonFactory.createUIRoundedButton(title: "Exchange", backgroundColor: .primary)
    
    private lazy var horizantalStackView = UIStackViewFactory.createStackView(with: .horizontal, alignment: .center, distribution: .fillEqually, spacing: 15, arrangedSubviews: [alertButton, exchageButton])
    
    private lazy var rateView: RateView = {
        let rate = RateView(exchangeData: Exchange.mock())
        rate.translatesAutoresizingMaskIntoConstraints = false
        rate.backgroundColor = .white
        return rate
    }()
    
    private lazy var periodArray = ["1 Day", "1 Week", "1 Month", "3 Month"]
    
    private lazy var shareButton = UIRoundedButtonFactory.createUIRoundedButton(title: periodArray[2],textColor: .primary, icon:UIImage(named: "chevronUp"))
    
    
    override func viewDidLoad() {
        ///Catch layer by tap detection
       
        self.title = "Graph View"
        self.view.addSubview(horizantalStackView)
        self.view.addSubview(rateView)
        self.view.addSubview(shareButton)
        
        
        shareButton.backgroundColor =  UIColor.primary.withAlphaComponent(0.16)
        shareButton.titleLabel?.font = .micro
        shareButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10);
        
        alertButton
            .height(constant: 52)
        
        exchageButton
            .height(constant: 52)
        
        rateView
            .toTopOf(horizantalStackView, .greaterThanOrEqualTo, constant:50)
            .height(with: .height, ofView: view, multiplier: 0.5)
            .alignEdgesWithSuperview([.right, .left], constant:25)
        
        horizantalStackView
            .height(.greaterThanOrEqualTo, constant: 52)
            .alignEdgesWithSuperview([.left, .right], constant:25)
            .alignEdgeWithSuperviewSafeArea(.bottom, constant:10)
        
        
        shareButton
            .toTopOf(rateView,constant:20)
            .width(constant: 100)
            .height(constant: 20)
            .centerHorizontallyInSuperview()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
       
    }
    
    private func getStrokeEndAnimation()->CABasicAnimation{
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = 0.0
            animation.toValue = 1.0
            animation.duration = 2.0
            animation.fillMode = .forwards
            animation.isRemovedOnCompletion = false
        animation.repeatCount = .infinity
            return animation
    }

   
}

