//
//  FirstViewController.swift
//  HW22 secondView
//
//  Created by Злата Лашкевич on 1.11.24.
//

import UIKit

class FirstViewController: UIViewController {
    
    lazy var pickerButton = UIButton()
    lazy var cityLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(pickerButton)
        view.addSubview(cityLabel)
        
        
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cityLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        
        
        pickerButton.translatesAutoresizingMaskIntoConstraints = false
        pickerButton.setTitle("Изметить город", for: .normal)
        pickerButton.setTitleColor(.orange, for: .normal)
        pickerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pickerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        pickerButton.addTarget(self, action: #selector(presentCity), for: .touchUpInside)
    }
    
    @objc func presentCity(){
        let controller = PickerController()
        controller.delegate = self
        present(controller, animated: true)
    }
}

extension FirstViewController: SaveButtonDelegate {
    func saveCity(name: String) {
        cityLabel.text = name
    }
}
