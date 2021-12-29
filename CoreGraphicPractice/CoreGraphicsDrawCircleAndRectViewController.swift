//
//  CoreGraphicsDrawCircleAndRectViewController.swift
//  CoreGraphicPractice
//
//  Created by Yong Jun Cha on 2021/12/29.
//

import UIKit

class CoreGraphicsDrawCircleAndRectViewController: UIViewController {
    
    let rectAndCircleView = RectAndCircleView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray5
        rectAndCircleView.translatesAutoresizingMaskIntoConstraints = false
        rectAndCircleView.backgroundColor = .cyan
        
        view.addSubview(rectAndCircleView)
        
        NSLayoutConstraint.activate([
            rectAndCircleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rectAndCircleView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rectAndCircleView.widthAnchor.constraint(equalToConstant: 400),
            rectAndCircleView.heightAnchor.constraint(equalToConstant: 400),
        ])
        
        print(UIScreen.main.bounds.size)
    }
}

class RectAndCircleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else {return}
        
        let rectangle1 = CGRect(x: 0, y: 0, width: 200, height: 180).insetBy(dx: 10, dy: 10)
        context.setFillColor(UIColor.systemRed.cgColor)
        context.setStrokeColor(UIColor.systemGreen.cgColor)
        // If We Set LineWidth 20 => Half of Width(10) will be set inside of the rectangle and other side set in outside of rectangle.
        context.setLineWidth(20)
        context.addRect(rectangle1)
        context.drawPath(using: .fillStroke)
        context.fill(rectangle1)
        
    
        let rectangle2 = CGRect(x: 256, y: 256, width: 128, height: 128).insetBy(dx: 10, dy: 10)
        context.setFillColor(UIColor.systemYellow.cgColor)
        context.setStrokeColor(UIColor.systemBlue.cgColor)
        context.setLineWidth(10)
        context.addEllipse(in: rectangle2)
        context.drawPath(using: .fillStroke)
    }
    
}
