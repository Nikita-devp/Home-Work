//
//  TimeViewController.swift
//  HW24
//
//  Created by Злата Лашкевич on 4.11.24.
//

import UIKit

protocol saveButtonDelegate: AnyObject {
    func saveButton(UTC: Int)
}


class UTCViewController: UIViewController{
    
    lazy var pickerView = UIPickerView()
    lazy var saveButton = UIButton()
    var cityUTC = ""
    weak var delegate: saveButtonDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(pickerView)
        view.addSubview(saveButton)
        view.backgroundColor = .gray
        

        pickerView.delegate = self
        pickerView.dataSource = self
        
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.addTarget(self, action: #selector(saveDismisButton), for: .touchUpInside)
        
        
    }
    
    @objc func saveDismisButton(){
        delegate?.saveButton(UTC: Int(cityUTC) ?? 0)
        self.dismiss(animated: true)
    }
    
}

extension UTCViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cityList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cityList[row].name + "\(cityList[row].timeZone) UTC"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cityUTC = "\(cityList[row])"
    }
}

