//
//  ViewController.swift
//  HW21
//
//  Created by Злата Лашкевич on 20.10.24.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var stackView = UIStackView()
    lazy var segmentColor = UISegmentedControl(items: ["красный", "голубой","зеленый", "черный"])
    lazy var segmentFont = UISegmentedControl(items: ["обычный", "большой"])
    lazy var label = UITextView()
    lazy var acceptButton = UIButton()
    lazy var resetButton = UIButton()
    lazy var buttonStackView = UIStackView()
    
    let textEdit = NSMutableAttributedString(string: "BMW AG — немецкий производитель автомобилей, мотоциклов, двигателей, а также велосипедов")
    
    let textgap = NSString(string: "BMW AG — немецкий производитель автомобилей, мотоциклов, двигателей, а также велосипедов").range(of: "BMW AG — немецкий производитель автомобилей, мотоциклов, двигателей, а также велосипедов")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
        view.addSubview(buttonStackView)

        
        acceptButton.setTitle("Применить", for: .normal)
        acceptButton.backgroundColor = .green
        
        resetButton.setTitle("Сбросить", for: .normal)
        resetButton.backgroundColor = .red
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(buttonStackView)
        stackView.distribution = .fillEqually
        
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 15
        buttonStackView.distribution = .fillProportionally
        buttonStackView.addArrangedSubview(segmentFont)
        buttonStackView.addArrangedSubview(segmentColor)
        buttonStackView.addArrangedSubview(acceptButton)
        buttonStackView.addArrangedSubview(resetButton)
        
        
        resetButton.addTarget(self, action: #selector(buttonReset), for: .touchUpInside)
        acceptButton.addTarget(self, action: #selector(setupButton), for: .touchUpInside)
    }
    
    
    func editText(){
        textEdit.addAttribute(.foregroundColor, value: UIColor.red, range: .init(location: 0, length: 100))
        textEdit.addAttribute(.foregroundColor, value: UIColor.green, range: .init(location: 0, length: 100))
        textEdit.addAttribute(.foregroundColor, value: UIColor.black, range: .init(location: 0, length: 100))
        textEdit.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 50), range: .init(location: 0, length: 100))
        label.attributedText = textEdit
    }

    func component(){
        segmentFont.selectedSegmentIndex = 0
        segmentColor.selectedSegmentIndex = 0
    }
    
    
    @objc func setupButton(){
        if segmentColor.selectedSegmentIndex == 0 {
            textEdit.addAttribute(.foregroundColor, value: UIColor.red, range: textgap)
            label.attributedText = textEdit }
        
        else if segmentColor.selectedSegmentIndex == 1 {
            textEdit.addAttribute(.foregroundColor, value: UIColor.blue, range: textgap)
            label.attributedText = textEdit }
        
        else if segmentColor.selectedSegmentIndex == 2 {
            textEdit.addAttribute(.foregroundColor, value: UIColor.green, range: textgap)
            label.attributedText = textEdit}
        
        else if segmentColor.selectedSegmentIndex == 3 {
            textEdit.addAttribute(.foregroundColor, value: UIColor.black, range: textgap)
            label.attributedText = textEdit}
        
        
        if segmentFont.selectedSegmentIndex == 0 {
            textEdit.addAttribute(.font, value: UIFont.systemFont(ofSize: 20), range: textgap)
            label.attributedText = textEdit }
        
        else if segmentFont.selectedSegmentIndex == 1 {
            textEdit.addAttribute(.font, value: UIFont.systemFont(ofSize: 35), range: textgap)
            label.attributedText = textEdit }
    }

    @objc func buttonReset(){
        textEdit.removeAttribute(.foregroundColor, range: textgap)
        textEdit.removeAttribute(.font, range: textgap)
        label.attributedText = textEdit
        segmentFont.selectedSegmentIndex = 0
        segmentColor.selectedSegmentIndex = 0
    }
}

