//
//  LoadingCycleView.swift
//  Animations Player - N25
//
//  Created by Zuka Papuashvili on 10.05.24.
//

import UIKit

final class LoadingCircleView: UIView {
    
    private let spinningCircle = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    private func configure() {
        frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        let rect = self.bounds
        let circularPath = UIBezierPath(ovalIn: rect)
        
        spinningCircle.path = circularPath.cgPath
        spinningCircle.fillColor = UIColor.clear.cgColor
        spinningCircle.strokeColor = UIColor.systemBlue.cgColor
        spinningCircle.lineWidth = 10
        spinningCircle.strokeEnd = 0.25
        spinningCircle.lineCap = .round
        
        layer.addSublayer(spinningCircle)
    }
    
    func startAnimating() {
        if spinningCircle.animation(forKey: "loadingAnimation") == nil {
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = 0
            animation.toValue = 1
            animation.duration = 2
            animation.repeatCount = .infinity
            animation.isRemovedOnCompletion = false
            animation.fillMode = .forwards
            spinningCircle.add(animation, forKey: "loadingAnimation")
        }
    }
    
    func stopAnimating() {
        spinningCircle.removeAnimation(forKey: "loadingAnimation")
    }
}
