//
//  ViewController.swift
//  HW22
//
//  Created by Злата Лашкевич on 1.11.24.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var acceptButton = UIButton()
    lazy var alertController = UIAlertController(title: "Важное сообщение", message: "Спасибо что используете это приложение", preferredStyle: .alert)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(acceptButton)
        alertSetup()
        
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        acceptButton.setTitle("Показать сообщение", for: .normal)
        acceptButton.setTitleColor(.green, for: .normal)
        acceptButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        acceptButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        acceptButton.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
        
    }
    
    
    func alertSetup(){
        alertController.addAction(UIAlertAction(title: "Спасибо", style: .default, handler: { _ in print("yes")}))
        
        alertController.addAction(UIAlertAction(title: "Неинтересно", style: .default, handler: { _ in print("no")}))
        
        present(alertController, animated: true)
    }
    
    @objc func buttonHandler(){
        let controller = alertController
        present(controller, animated: true)
    }
}

