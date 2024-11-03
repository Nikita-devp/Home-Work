//
//  ViewController.swift
//  HW18
//
//  Created by Злата Лашкевич on 20.10.24.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var topLabel = UILabel()
    lazy var textField = UITextField()
    lazy var saveButton = UIButton()
    
    func tapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(keyboardClose))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(topLabel)
        view.addSubview(textField)
        view.addSubview(saveButton)
        
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.keyboardType = .default
        
        
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.backgroundColor = .gray
        topLabel.text = "..."
        topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 75).isActive = true
        topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
    
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitle("Применить", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.backgroundColor = .green
        saveButton.layer.cornerRadius = 20
        saveButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 15).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.addTarget(self, action: #selector(buttonTraped), for: .touchUpInside)
        
    }
    
    @objc func buttonTraped() {
        if textField.text == "" {
            textField.placeholder = "Enter text"
        } else {
            topLabel.text = textField.text
                        textField.text = ""
                        textField.resignFirstResponder()
        }
    }
    
    
    @objc func keyboardClose(){
        view.endEditing(true)
    }
}

