//
//  RotateAndScaleViewController.swift
//  CoreGraphicPractice
//
//  Created by Yong Jun Cha on 2021/12/29.
//

import Foundation
import UIKit

class RotateScaleShakeViewController: UIViewController {
    
    let redView = UIView()
    let _width: CGFloat = 140
    let _height: CGFloat = 100

    override func viewDidLoad() {
        super.viewDidLoad()
        redView.backgroundColor = .systemRed
        view.backgroundColor = .systemGray6
        // Do any additional setup after loading the view.
        
        view.addSubview(redView)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        // Once we get in here our view is layed out
        super.viewDidAppear(animated)
        // So We can dyna,ically center it one ther screen
        // (no hard coded values)
        redView.frame = CGRect(x: view.bounds.midX - _width/2, y: view.bounds.midY - _height/2, width: _width, height: _height)
        
        scaleOut()
        shake()
        rotate()
    }
    
    func rotate() {
        let animation = CABasicAnimation()
        animation.keyPath = "transform.rotation.z" // z-axis
        // anchor point
        animation.fromValue = 0
        animation.toValue = CGFloat.pi
        animation.duration = 1
        
        redView.layer.add(animation, forKey: "basic")
        // If we do not set this position, redview position will be reset.
        redView.layer.transform = CATransform3DMakeRotation(CGFloat.pi, 4, 0, 0)
    }
    
    func scaleOut() {
        let animation = CABasicAnimation()
        animation.keyPath = "transform.scale"
        animation.fromValue = 1
        animation.toValue = 2
        animation.duration = 1
        
        redView.layer.add(animation, forKey: "basic")
        // If we do not set this position, redview position will be reset.
        redView.layer.transform = CATransform3DMakeScale(2, 2, 1)
    }
    
    func shake() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
        animation.duration = 0.4
        
        animation.isAdditive = true
        redView.layer.add(animation, forKey: "shake")
    }
    
}
