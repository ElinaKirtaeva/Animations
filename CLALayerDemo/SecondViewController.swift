//
//  SecondViewController.swift
//  CLALayerDemo
//
//  Created by Элина Рупова on 08.02.2022.
//

import UIKit

class SecondViewController: UIViewController, CAAnimationDelegate {

    var roundShapeLayer: CAShapeLayer! {
        didSet {
            roundShapeLayer.lineWidth = 20
            roundShapeLayer.lineCap = .round
            roundShapeLayer.fillColor = nil
            roundShapeLayer.strokeEnd = 0
            roundShapeLayer.strokeColor = UIColor.white.cgColor
            
        }
    }
    
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.layer.shadowRadius = 5
            button.layer.shadowOpacity = 0.5
            button.layer.shadowOffset = CGSize(width: 0, height: 10)
        }
    }
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
//            imageView.layer.borderColor = UIColor(red: 0.7, green: 0.9, blue: 1, alpha: 1).cgColor
//            imageView.layer.borderWidth = 20
            imageView.layer.cornerRadius = imageView.frame.size.height / 2
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        roundShapeLayer = CAShapeLayer()
        view.layer.addSublayer(roundShapeLayer)
        addAnimation()
        
    }
    
    override func viewDidLayoutSubviews() {
        roundShapeLayer.frame = view.bounds
        let path = UIBezierPath(roundedRect: CGRect(x: imageView.frame.minX, y: imageView.frame.minY, width: imageView.frame.size.height, height: imageView.frame.size.height), cornerRadius: imageView.frame.size.height / 2)
        roundShapeLayer.path = path.cgPath

    }

    func addAnimation() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.fillMode = CAMediaTimingFillMode.both
        animation.isRemovedOnCompletion = true
        animation.delegate = self
        roundShapeLayer.add(animation, forKey: nil)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        addAnimation()
    }

}
