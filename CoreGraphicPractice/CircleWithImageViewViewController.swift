//
//  CircleWithImageViewViewController.swift
//  CoreGraphicPractice
//
//  Created by Yong Jun Cha on 2021/12/29.
//

import UIKit

class CircleWithImageViewViewController: UIViewController {
    
    let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 400),
            imageView.heightAnchor.constraint(equalToConstant: 400),
        ])
        
        drawCircle()
    }
    
    func drawCircle() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 400, height: 400))
        
        let img = renderer.image { ctx in
            
            let rectangle = CGRect(x: 0, y: 0, width: 400, height: 400).insetBy(dx: 5, dy: 5)
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(10)
            
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        
        imageView.image = img
    }
    
}
