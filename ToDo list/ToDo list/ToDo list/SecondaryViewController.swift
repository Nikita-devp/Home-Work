//
//  ViewController.swift
//  ToDo list
//
//  Created by Никита Гойшик on 19.02.25.
//

protocol SecondaryViewControllerDelegate: AnyObject {
    func didSave(note: Note)
}

import UIKit

class SecondaryViewController: UIViewController {
    
    lazy var fieldText = UITextView()
    lazy var saveButton = UIButton()
    lazy var label = UILabel()
    
    weak var delegate: SecondaryViewControllerDelegate?
    
    let firstClass = FirstViewController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = false

        view.addSubview(fieldText)
        view.addSubview(saveButton)
        view.addSubview(label)
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .monospacedDigitSystemFont(ofSize: 30, weight: .heavy)
        label.text = "Введите задачу"
        label.bottomAnchor.constraint(equalTo: fieldText.topAnchor, constant: -20).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70).isActive = true
        
        
        fieldText.translatesAutoresizingMaskIntoConstraints = false
        fieldText.font = .boldSystemFont(ofSize: 20)
        fieldText.keyboardType = .default
        fieldText.textAlignment = .center
        fieldText.backgroundColor = .systemGray6
        fieldText.layer.cornerRadius = 20
        
        fieldText.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        fieldText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -410).isActive = true
        fieldText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        fieldText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
        saveButton.setTitleColor(.black, for: .highlighted)
        saveButton.setTitleColor(.systemBlue, for: .focused)
        saveButton.backgroundColor = .systemGray5
        saveButton.layer.cornerRadius = 25
        
        saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        saveButton.addTarget(self, action: #selector(saveText), for: .touchUpInside)
        
    }

    @objc func saveText(){
        guard let text = fieldText.text, !text.isEmpty else { return }
        let note = Note(text: text)
        delegate?.didSave(note: note)
        navigationController?.popViewController(animated: true)
        
    }
    
}

