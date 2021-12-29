//
//  ViewController.swift
//  CoreGraphicPractice
//
//  Created by Yong Jun Cha on 2021/12/28.
//

import UIKit

class ViewController: UIViewController {
    
//    UIColor.init(red: 118, green: 140, blue: 180, alpha: 0)
    let moveAnimationButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("MOVE ANIMATION", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray5.cgColor
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(presentMoveAnimationSheet), for: .touchUpInside)
        return button
    }()
    
    let rotateScaleShakeAnimationButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ROTATE SHAKE SCALE ANIMATION", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray5.cgColor
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(presentRotateScaleShakeAnimationSheet), for: .touchUpInside)
        return button
    }()
    
    let followCirclePathAnimationButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("FOLLOW CIRCLE PATH ANIMATION", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray5.cgColor
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(presentFollowCirclePathAnimationSheet), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    func layout() {
        moveAnimationButton.translatesAutoresizingMaskIntoConstraints = false
        rotateScaleShakeAnimationButton.translatesAutoresizingMaskIntoConstraints = false
        followCirclePathAnimationButton.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [moveAnimationButton, rotateScaleShakeAnimationButton, followCirclePathAnimationButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -300),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
        ])
    }
    
    @objc func presentMoveAnimationSheet(sender: UIButton!) {
        present(MoveViewController(), animated: true) {
            print("MOVE ANIMATION START")
        }
    }
    
    @objc func presentRotateScaleShakeAnimationSheet(sender: UIButton!) {
        present(RotateScaleShakeViewController(), animated: true) {
            print("MOVE ANIMATION START")
        }
    }
    
    @objc func presentFollowCirclePathAnimationSheet(sender: UIButton!) {
        present(FollowCirclePathViewController(), animated: true) {
            print("MOVE ANIMATION START")
        }
    }
    
}


