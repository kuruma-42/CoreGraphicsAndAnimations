//
//  FollowCirclePathViewController.swift
//  CoreGraphicPractice
//
//  Created by Yong Jun Cha on 2021/12/29.
//

import UIKit

class FollowCirclePathViewController: UIViewController {
    
    let redView = UIView()
    let _width: CGFloat = 40
    let _height: CGFloat = 40
    
    let redCircle = UIImageView()
    let _diameter: CGFloat = 300
    

    override func viewDidLoad() {
        super.viewDidLoad()
        redView.backgroundColor = .systemRed
        view.backgroundColor = .systemGray6
        
        view.addSubview(redView)
        view.addSubview(redCircle)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        // Once we get in here our view is layed out
        super.viewDidAppear(animated)
        
        // draw box
        redView.frame = CGRect(x: view.bounds.midX - _width/2, y: view.bounds.midY - _height/2, width: _width, height: _height)
        
        // draw circle
        redCircle.frame = CGRect(x: view.bounds.midX - _diameter/2, y: view.bounds.midY - _diameter/2, width: _diameter, height: _diameter)
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: _diameter, height: _diameter))
        
        let img = renderer.image { ctx in
            let rectangle = CGRect(x: 0, y: 0, width: _diameter, height: _diameter).insetBy(dx: 0.5, dy: 0.5)
            
            ctx.cgContext.setStrokeColor(UIColor.systemYellow.cgColor)
            ctx.cgContext.setFillColor(UIColor.clear.cgColor)
            ctx.cgContext.setLineWidth(1)
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        redCircle.image = img
        followThrough()
    }
    
    func followThrough() {
        let boundingRect = CGRect(x: -_diameter/2, y: -_diameter/2, width: _diameter, height: _diameter)
        
        let orbit = CAKeyframeAnimation()
        orbit.keyPath = "position"
        
        orbit.path = CGPath(ellipseIn: boundingRect, transform: nil)
        orbit.duration = 2
        orbit.isAdditive = true
        orbit.calculationMode = CAAnimationCalculationMode.paced;
        orbit.rotationMode = CAAnimationRotationMode.rotateAuto;
        
        redView.layer.add(orbit, forKey: "follow through")
        
    }
    
}
