//
//  ViewController.swift
//  HW24
//
//  Created by Злата Лашкевич on 4.11.24.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var setTimeButton = UIButton()
    lazy var timeLabel = UILabel()
    
    var timer: Timer?
    var UTCValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(setTimeButton)
        view.addSubview(timeLabel)
        
        setTimeButton.translatesAutoresizingMaskIntoConstraints = false
        setTimeButton.setTitle("Изменить", for: .normal)
        setTimeButton.setTitleColor(.black, for: .normal)
        setTimeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        setTimeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        setTimeButton.addTarget(self, action: #selector(cityPicker), for: .touchUpInside)
        
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        timeLabel.backgroundColor = .gray
        
        
    }
    
    func setTime() {
        let date = Date()
        let calendar = Calendar.current
        let modifiedDate = calendar.date(byAdding: .hour, value: UTCValue, to: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        timeLabel.text = dateFormatter.string(from: modifiedDate ?? date)
    }
    
    
    @objc func updateLabel(){
        setTime()
        
    }
    
    
    func labelUpdate() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateLabel),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    
    @objc func cityPicker() {
        let vcontroller = UTCViewController()
        vcontroller.delegate = self
        present(vcontroller, animated: true)
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
        labelUpdate()
        
    }
}
