//
//  ViewController.swift
//  HW15
//
//  Created by Злата Лашкевич on 6.10.24.
//

import UIKit

class FirstViewController: UIViewController {
    
    lazy var QuizeButton: UIButton = UIButton()
    lazy var QuizeLabel: UILabel = UILabel()
    lazy var сustomViewController: CustomViewController = CustomViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(QuizeLabel)
        view.addSubview(QuizeButton)
        view.addSubview(сustomViewController)
        
        
        QuizeLabel.text = "День"
        QuizeLabel.textColor = .black
        QuizeLabel.translatesAutoresizingMaskIntoConstraints = false
        QuizeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        QuizeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
        QuizeButton.translatesAutoresizingMaskIntoConstraints = false
        QuizeButton.setTitle("Изменить", for: .normal)
        QuizeButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        QuizeButton.setTitleColor(.black, for: .normal)
        QuizeButton.setTitleColor(.blue, for: .highlighted)
        QuizeButton.topAnchor.constraint(equalTo: QuizeLabel.bottomAnchor, constant: 50).isActive = true
        QuizeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        сustomViewController.translatesAutoresizingMaskIntoConstraints = false
        сustomViewController.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        сustomViewController.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        сustomViewController.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 150).isActive = true
        сustomViewController.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 150).isActive = true
    }
    
    @objc func actionButton(sender: UIButton){
        let actionButtonSendTag: UIButton
        var controller = FirstViewController()
        var controlle = CustomViewController()
        present(controller, animated: true)
        
    }
    
    class CustomViewController: UIControl {
        
        private let onView = UIImageView()
        private let offView = UIImageView()
        private var isOn = false
        
        override init(frame: CGRect){
            super.init(frame: frame)
            setupCustomView()
            updadeUI()
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupCustomView(){
            addSubview(onView)
            onView.image = UIImage(systemName: "trash")
            onView.contentMode = .scaleAspectFit
            
            addSubview(offView)
            offView.image = UIImage(systemName: "pencil")
            offView.frame = bounds
            offView.contentMode = .scaleAspectFit
            
            addTarget(self, action: #selector(touchTup), for: .touchUpInside)
        }
        
        
        @objc func touchTup(){
            isOn.toggle()
            updadeUI()
            sendActions(for: .valueChanged)
        }
        
        func setOn(_ isOn: Bool, animated: Bool){
            self.isOn = isOn
            let duration = animated ? 0.3 : 0
            UIView.animate(withDuration: duration){
                self.updadeUI()
            }
        }
        
        private func updadeUI(){
            onView.isHidden = isOn
            offView.isHidden = isOn
            self.isHidden = isOn
            
        }
    }
}
