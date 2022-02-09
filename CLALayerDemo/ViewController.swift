//
//  ViewController.swift
//  CLALayerDemo
//
//  Created by Элина Рупова on 08.02.2022.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {
    
    var shapeLayer: CAShapeLayer! {
        didSet {
            shapeLayer.lineWidth = 20
            shapeLayer.lineCap = .round
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 1
            shapeLayer.strokeColor = UIColor(red: 0.7, green: 0.9, blue: 1, alpha: 1).cgColor
            
        }
    }
    
    var overshapeLayer: CAShapeLayer! {
        didSet {
            overshapeLayer.lineWidth = 20
            overshapeLayer.lineCap = .round
            overshapeLayer.fillColor = nil
            overshapeLayer.strokeEnd = 0
            overshapeLayer.strokeColor = UIColor.white.cgColor
            
        }
    }
    
    var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
//            let startColor = UIColor(named: "Color")!
            let startColor = UIColor(red: 0.4, green: 0.5, blue: 1, alpha: 1)
            let endColor = UIColor(red: 0.4, green: 0.9, blue: 1, alpha: 1)
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
//            gradientLayer.locations = [0, 0.2, 1]
        }
    }
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.size.height / 2
            imageView.layer.masksToBounds = true
            let borderColor = UIColor.white
            imageView.layer.borderColor = borderColor.cgColor
            imageView.layer.borderWidth = 10
        }
    }
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.layer.shadowOffset = CGSize(width: 0, height: 10)
            button.layer.shadowOpacity = 0.5
            button.layer.shadowRadius = 5
        }
    }
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        conficShapeLayer(shapeLayer)
        conficShapeLayer(overshapeLayer)
    }
    
    func conficShapeLayer(_ shapelayer: CAShapeLayer) {
        shapelayer.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.view.frame.width / 2 - 150, y: self.view.frame.height / 2 + 200))
        path.addLine(to: CGPoint(x: self.view.frame.width / 2 + 150, y: self.view.frame.height / 2 + 200))
        shapelayer.path = path.cgPath
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
        shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
        
        overshapeLayer = CAShapeLayer()
        view.layer.addSublayer(overshapeLayer)
    }

    @IBAction func tapped(_ sender: UIButton) {
        //        overshapeLayer.strokeEnd += 0.2
        //        if overshapeLayer.strokeEnd == 1 {
        //            performSegue(withIdentifier: "showSecondScreen", sender: self)
        //        }
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.fillMode = CAMediaTimingFillMode.both
        animation.isRemovedOnCompletion = false
        animation.delegate = self
        overshapeLayer.add(animation, forKey: nil)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        performSegue(withIdentifier: "showSecondScreen", sender: self)
    }
}

