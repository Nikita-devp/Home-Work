//
//  ViewController.swift
//  HW17
//
//  Created by Злата Лашкевич on 14.10.24.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var buttonStackView = UIStackView()
    lazy var leftButton = UIButton()
    lazy var rightButton = UIButton()
    lazy var upButton = UIButton()
    lazy var downButton = UIButton()
    lazy var playZone = UIView()
    
    
    lazy var circle: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = .init(x: 50, y: 50, width: 50, height: 50)
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.backgroundColor = .systemRed
        return imageView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(playZone)
        playZone.addSubview(circle)
        view.addSubview(buttonStackView)
        
        playZone.translatesAutoresizingMaskIntoConstraints = false
        playZone.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        playZone.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor, constant: -10).isActive = true
        playZone.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        playZone.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        
        buttonStackView.addArrangedSubview(setupStack(itemTitle: "Down Go", button: downButton))
        buttonStackView.addArrangedSubview(setupStack(itemTitle: "Up Go", button: upButton))
        buttonStackView.addArrangedSubview(setupStack(itemTitle: "Right Go", button: rightButton))
        buttonStackView.addArrangedSubview(setupStack(itemTitle: "Left Go", button: leftButton))
        
        leftButton.addTarget(self, action: #selector(actionLeft), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(actionRight), for: .touchUpInside)
        upButton.addTarget(self, action: #selector(actionUp), for: .touchUpInside)
        downButton.addTarget(self, action: #selector(actionDown), for: .touchUpInside)

        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 30
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    func setupStack(itemTitle: String, button: UIButton) -> UIButton {
        button.setTitle(itemTitle, for: .normal)
        button.setTitleColor(.green, for: .highlighted)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 20
        return button
    }
    
    @objc func actionLeft(){
        UIView.animate(withDuration: 1, animations: {[weak self] in
            guard let self else {return}
            if circle.frame.origin.x > 20{
                circle.frame = .init(x: circle.frame.origin.x - 20,
                                     y: circle.frame.origin.y,
                                     width: circle.frame.width,
                                     height: circle.frame.height)}
            else {
                circle.frame = .init(x: 0, 
                                     y: circle.frame.origin.y,
                                     width: circle.frame.width,
                                     height: circle.frame.height)}
            })
        }
    
    @objc func actionRight(){
        UIView.animate(withDuration: 1, animations: {[weak self] in
            guard let self else {return}
            if playZone.frame.width > circle.frame.origin.x + 70 {
                circle.frame = .init(x: circle.frame.origin.x + 20,
                                     y: circle.frame.origin.y,
                                     width: circle.frame.width,
                                     height: circle.frame.height)
            } else {
                circle.frame = .init(x: (playZone.bounds.width - 50),
                                     y: circle.frame.origin.y,
                                     width: circle.frame.width,
                                     height: circle.frame.height)
            }
        })
        
    }
    
    @objc func actionUp(){
        UIView.animate(withDuration: 1, animations: {[weak self] in
            guard let self else {return}
            if circle.frame.origin.y > 20 {
                circle.frame = .init(x: circle.frame.origin.x,
                                     y: circle.frame.origin.y - 20,
                                     width: circle.frame.width,
                                     height: circle.frame.height)
            } else {
                            circle.frame = .init(x: circle.frame.origin.x,
                                     y: 0,
                                     width: circle.frame.width,
                                     height: circle.frame.height)
            }
        })
    }
    
    @objc func actionDown(){
        UIView.animate(withDuration: 1, animations: {[weak self] in
            guard let self else {return}
            if playZone.frame.height > circle.frame.origin.y + 70 {
                circle.frame = .init(x: circle.frame.origin.x,
                                     y: circle.frame.origin.y + 20,
                                     width: circle.frame.width,
                                     height: circle.frame.height)
                        } else {
                            circle.frame = .init(x: circle.frame.origin.x,
                                     y: (playZone.bounds.height - 50),
                                     width: circle.frame.width,
                                     height: circle.frame.height)
            }
        })
    }
}
