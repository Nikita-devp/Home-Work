//
//  ViewController.swift
//  HW24
//
//  Created by Злата Лашкевич on 3.11.24.
//

import UIKit

class ViewController: UIViewController {

    lazy var timeAndCityButton = UIButton()
    lazy var timeAndCityLabel = UILabel()
    
    var UTCValue = 0
    
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(timeAndCityLabel)
        view.addSubview(timeAndCityButton)
    
        
        timeAndCityLabel.translatesAutoresizingMaskIntoConstraints = false
        timeAndCityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timeAndCityLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        timeAndCityLabel.text = ".."
        
        timeAndCityButton.translatesAutoresizingMaskIntoConstraints = false
        timeAndCityButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25).isActive = true
        timeAndCityButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timeAndCityButton.setTitle("Изменить город", for: .normal)
        timeAndCityButton.setTitleColor(.black, for: .normal)
        timeAndCityButton.tintColor = .black
        timeAndCityButton.setTitleColor(.green, for: .highlighted)
        timeAndCityButton.addTarget(self, action: #selector(setCity), for: .touchUpInside)
        
    }
    
    func loadLabel(){
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(times), userInfo: nil, repeats: true)
    }
    
    func setTime(){
        let date = Date()
        let calendar = Calendar.current
        let viewDate = DateFormatter()
        let viewCalendar = calendar.date(byAdding: .hour, value: UTCValue, to: date)
        viewDate.dateFormat = "HH:mm:ss"
        viewDate.timeZone = TimeZone(abbreviation: "UTC")
        timeAndCityLabel.text = viewDate.string(from: viewCalendar ?? date)
    }
    
    
    
    @objc func times(){
        setTime()
    }
    
    @objc func setCity(){
        let controller = UTCViewController()
        controller.delegate = self
        present(controller, animated: true)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer?.invalidate()
        timer = nil
    }
}

extension ViewController: saveButtonDelegate {
    func saveButton(UTC: Int) {
        UTCValue = UTC
    }
}

// MARK: New class


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
        cityUTC = "\(cityList[row].timeZone)"
    }
}
