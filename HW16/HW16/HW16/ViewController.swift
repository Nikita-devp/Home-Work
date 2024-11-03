//
//  ViewController.swift
//  HW16
//
//  Created by Злата Лашкевич on 14.10.24.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var frontImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = .init(x: 100, y: 100, width: 100, height: 100)
        imageView.layer.cornerRadius = 50
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shadowRadius = 15
        imageView.backgroundColor = .systemRed
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(frontImage)
     
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(targetMethod))
                frontImage.addGestureRecognizer(tapGestureRecognizer)
        
    }
    @objc func targetMethod(){

        let xRandom = CGFloat.random(in: 0...(view.bounds.width - frontImage.frame.width))
        let yRandom = CGFloat.random(in: 0...(view.bounds.height - frontImage.frame.width))
        
        frontImage.backgroundColor = [UIColor.red, UIColor.black, UIColor.blue, UIColor.green, UIColor.cyan, UIColor.orange, UIColor.purple].randomElement()
        frontImage.frame.origin = CGPoint(x: xRandom, y: yRandom)
        
    }
}

