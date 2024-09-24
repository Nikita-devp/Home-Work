//
//  ViewController.swift
//  HW12
//
//  Created by Злата Лашкевич on 22.09.24.
//

import UIKit

class EditViewController: UIViewController {

        weak var delegate: EditViewControllerDelegate?
        private let saveButton = UIButton()
        private let editText = UITextField()
        var LabellTag: Int?
        var editString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        SetupEditText()
        SetupsaveButton()

    }
    
    func SetupsaveButton() {
        view.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        saveButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        saveButton.setTitle("Safe", for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonEdit), for: .touchUpInside)
        saveButton.setTitleColor(.green, for: .normal)
    }
    
    func SetupEditText() {
        view.addSubview(editText)
        editText.translatesAutoresizingMaskIntoConstraints = false
        editText.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        editText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        editText.backgroundColor = .gray
        editText.layer.cornerRadius = 10
        editText.text = editString
        
        
    }
    
    
    
    @objc func saveButtonEdit() {
        guard let text = editText.text, let tag = LabellTag else {return}
        delegate?.updateUserInfoLabel(editText: text, tag: tag)
        dismiss(animated: true)
    }
}
