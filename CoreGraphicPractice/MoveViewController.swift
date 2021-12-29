//
//  moveViewController.swift
//  CoreGraphicPractice
//
//  Created by Yong Jun Cha on 2021/12/28.
//

import UIKit

// Mark: - Core Animation Move 
class MoveViewController: UIViewController {
    
    let redView = UIView(frame: CGRect(x: 20, y: 100, width: 140, height: 100))

    override func viewDidLoad() {
        super.viewDidLoad()
        redView.backgroundColor = .systemRed
        // Do any additional setup after loading the view.
        
        view.addSubview(redView)
        animate()
    }
    
    func animate() {
        let animation = CABasicAnimation()
        animation.keyPath = "position.x"
        // anchor point
        animation.fromValue = 20 + 140/2
        animation.toValue = 300
        animation.duration = 1
        
        redView.layer.add(animation, forKey: "basic")
        // If we do not set this position, redview position will be reset.
        redView.layer.position = CGPoint(x: 300, y: 100 + 100/2)
        
    }
    
}
