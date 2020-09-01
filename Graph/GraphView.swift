import UIKit
public class GraphView: UIView {
    
    //MARK:- views
    private lazy var popUpView: PopUpView = {
        let popup = PopUpView()
        popup.frame = CGRect(origin: .zero, size: CGSize(width: 135, height: 50))
        return popup
        
    }()
    
    private lazy var  indicator: UIImageView = {
        let imageViwe = UIImageView()
        imageViwe.frame = CGRect(origin: .zero, size: CGSize(width: 20, height: 20))
        imageViwe.image = UIImage(named: "pin")
        return imageViwe
    }()
    
    private lazy var shapeLayer: CAShapeLayer = {
        let shape = CAShapeLayer()
        shape.strokeColor = UIColor.primary.cgColor
        shape.lineWidth = 2
        shape.lineDashPattern = [4,4]
        shape.fillColor = UIColor.clear.cgColor
        return shape
    }()
    
    private lazy var maskLayer: CAShapeLayer = {
           let shape = CAShapeLayer()
           return shape
       }()
    
    private lazy var  gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [#colorLiteral(red: 0.9705377221, green: 0.9600282311, blue: 0.9863556027, alpha: 1),UIColor.white].map{ $0.cgColor }
        gradient.locations = [0.6,1.0]
        return gradient
    }()
    
    private lazy var lpgr: UILongPressGestureRecognizer = {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        longPress.minimumPressDuration = 0.1
        return longPress
    }()
    
    private lazy var toolTipY = popUpView.bounds.midY + popUpView.arrowHeight + 15
    
    //MARK:- properties
    private var offsetFromSides: CGFloat = 5 {
        didSet {
             setNeedsDisplay()
        }
    }
    
    public var data: [ExchangeCurrecncy]?  {
        didSet {
            updatePaths()
        }
    }
    
    private lazy var points = [CGPoint]()
    private var path: UIBezierPath!
    
    //MARK:- initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    public convenience init(_ exchangeData: Exchange?) {
        self.init(frame:.zero)
        data = exchangeData?.exchangeCurrecncy
    
    }
    
    private func commonInit(){
        setupView()
    }
    
    
     //MARK:- SetupView
    
    private func setupView() {
        
        addGestureRecognizer(lpgr)
        layer.addSublayer(shapeLayer)
        layer.addSublayer(gradientLayer)
    }
    
     //MARK:- View life cycle

    public override func layoutSubviews() {
         updatePaths()
    }
    
    private func updatePaths() {
        
        points.removeAll()
        path = quadCurvedPath()
        shapeLayer.path = path.cgPath
        maskLayer.path = clipppingPath().cgPath
        
        gradientLayer.frame = bounds
        gradientLayer.mask = maskLayer
    }
}

//MARK: - Drawing UIBzierPaths

private extension GraphView {
    
     func coordYFor(index: Int) -> CGFloat {
          
          guard let min = data?.min(),  let max = data?.max() , let val =  data?[index] else {
              return 0
          }
          
          let height: CGFloat = bounds.height  - 70
          let difference: CGFloat = CGFloat( max.currencyRate - min.currencyRate)
        
        if difference == 0 {
            return bounds.midY
        }
        
          let oneUnit = height / difference
          
          return bounds.height - ( CGFloat(val.currencyRate - min.currencyRate) * oneUnit )
      }
    
     func clipppingPath() -> UIBezierPath {
        
         guard let clippingPath = path.copy() as? UIBezierPath else {
             return UIBezierPath()
         }
         
         clippingPath.addLine(to: CGPoint(
             x: bounds.width ,
             y: bounds.height))
         
         clippingPath.addLine(to: CGPoint(x: 0 , y: bounds.height))
         clippingPath.close()
         return clippingPath
     }
     
     func quadCurvedPath() -> UIBezierPath {
         let path = UIBezierPath()
         
        guard let getData = data, bounds.width > 0 else { return path}
         
         let step = ( bounds.width - offsetFromSides ) / CGFloat(getData.count - 1)

         let p1 = CGPoint(x: offsetFromSides/2, y: coordYFor(index: 0))
         path.move(to: p1)
         
         points.append(p1)

         for i in 1..<getData.count {
             let p2 = CGPoint(x: step * CGFloat(i), y: coordYFor(index: i))
             
             points.append(p2)
             path.addLine(to: p2)
             
         }
         return path;
     }
}

//MARK: - UILongPressGestureRecognizer Action

private extension GraphView {
    
    @objc func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        
        let tapLocation: CGPoint = gestureReconizer.location(in: self)
        guard let index =  tapLocation.getNearestXIndex(from: points) else { return }
        
        let point =  points[index]
        
        if let getData = data?[index] {
            
            popUpView.configure(value: String(format: "%.4f", getData.currencyRate), dateString: getData.convertTime)
        }
        
        if gestureReconizer.state == UIGestureRecognizer.State.began {
            indicator.center = point
            
            addSubview(popUpView)
            addSubview(indicator)
            
            if bounds.contains(CGRect(origin: CGPoint(x: point.x - popUpView.bounds.maxX/2, y: popUpView.bounds.midY), size: popUpView.bounds.size)) {
                popUpView.center = CGPoint(x: point.x, y: point.y - toolTipY)
                popUpView.setMidleAnchor()
            } else {
                setPointerAndPopup(point)
            }
            
        }  else if gestureReconizer.state == .changed {
            
            let animations = {
                 self.indicator.center = point
                if self.bounds.contains(CGRect(origin: CGPoint(x: point.x - self.popUpView.bounds.maxX/2, y: self.popUpView.bounds.midY), size: self.popUpView.bounds.size)) {
                
                
                    
                    self.popUpView.center = CGPoint(x: point.x, y:point.y - self.toolTipY)
                    self.popUpView.setMidleAnchor()
                   
                }

            else {
                self.setPointerAndPopup(point)
            }
        }
            UIView.animate(withDuration: 0.2, delay: 0, options: [.curveLinear],
            animations: animations,
            completion: nil)
        } else {
            indicator.removeFromSuperview()
            popUpView.removeFromSuperview()
        }
    }
    
    
     func setPointerAndPopup(_ point: CGPoint) {
        if point.x < 90 {
            popUpView.center = CGPoint(x: popUpView.bounds.midX, y:point.y - toolTipY)
        } else {
            popUpView.center = CGPoint(x:(popUpView.superview?.bounds.maxX ?? 0) - popUpView.bounds.maxX/2 , y:point.y - toolTipY )
        }
        popUpView.arrowXOffset = self.convert(point, to: popUpView).x - offsetFromSides
        
        
        
    }
}
