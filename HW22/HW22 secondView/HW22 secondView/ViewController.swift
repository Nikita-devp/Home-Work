//
//  ViewController.swift
//  HW22 secondView
//
//  Created by Злата Лашкевич on 1.11.24.
//

import UIKit

protocol SaveButtonDelegate: AnyObject{
    func saveCity(name: String)
}

class PickerController: UIViewController {
    
    lazy var saveButton = UIButton()
    lazy var pickerController = UIPickerView()
    
    weak var delegate: SaveButtonDelegate?
    
    let city = ["Москва","Минск","Санкт-Питербург","Брест","Лондон","Владивосток","Челябинск","Чита"]
    var savename = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(pickerController)
        view.addSubview(saveButton)
        view.backgroundColor = .gray
        
        pickerController.delegate = self
        pickerController.dataSource = self
        pickerController.translatesAutoresizingMaskIntoConstraints = false
        pickerController.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pickerController.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.topAnchor.constraint(equalTo: pickerController.bottomAnchor, constant: 50).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.addTarget(self, action: #selector(buttonTarget), for: .touchUpInside)
        
    }
    
    @objc func buttonTarget(){
        delegate?.saveCity(name: savename)
        self.dismiss(animated: true)
    }
    
}
    
extension PickerController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        city.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        city[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        savename = city[row]
    }
    
}



