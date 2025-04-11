//
//  FinalViewController.swift
//  Momentum
//
//  Created by Злата Лашкевич on 10.04.25.
//

import UIKit

class FinalViewController: UIViewController {
    
    lazy var frontImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = .init(x: 0, y: 0, width: 400, height: 120)
        imageView.backgroundColor = .systemBrown
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var backButton = UIButton()
    lazy var topLabel = UILabel()
    lazy var pay = UIButton()
    lazy var lastLabel = UILabel()
    lazy var firstLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        view.backgroundColor = .white
        
        view.addSubview(frontImage)
        view.addSubview(backButton)
        view.addSubview(topLabel)
        view.addSubview(pay)
        view.addSubview(lastLabel)
        view.addSubview(firstLabel)
        
        
        //MARK: Кнопка Назад
        backButton.setImage(UIImage(systemName: "arrowshape.left.fill"), for: .normal)
        backButton.tintColor = UIColor.white
        backButton.addTarget(self, action: #selector(goToProduction), for: .touchUpInside)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -38).isActive = true
        backButton.trailingAnchor.constraint(equalTo: topLabel.leadingAnchor, constant: 10).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 65).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        
        //MARK: Лейбл Оформление
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.text = "Оплата"
        topLabel.font = .systemFont(ofSize: 20, weight: .medium)
        
        topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45).isActive = true
        topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -15).isActive = true
        
        
        //MARK: Оплата
        pay.setTitle("Вернуться к покупкам", for: .normal)
        pay.backgroundColor = .systemBrown
        pay.layer.cornerRadius = 17
        pay.addTarget(self, action: #selector(goToGeneral), for: .touchUpInside)
        
        pay.translatesAutoresizingMaskIntoConstraints = false
        pay.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        pay.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        pay.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        
        
        lastLabel.text = "Спасибо за заказ!"
        lastLabel.textColor = .black
        lastLabel.font = .systemFont(ofSize: 30)
        
        lastLabel.translatesAutoresizingMaskIntoConstraints = false
        lastLabel.topAnchor.constraint(equalTo: frontImage.bottomAnchor, constant: 15).isActive = true
        lastLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        
        firstLabel.text = "Вся информация по заказу будет отображена в сообщении (Telegram)."
        firstLabel.textColor = .black
        firstLabel.font = .systemFont(ofSize: 15)
        firstLabel.numberOfLines = 2
        
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.topAnchor.constraint(equalTo: lastLabel.bottomAnchor, constant: 25).isActive = true
        firstLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        firstLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    }
    
    @objc func goToProduction(){
        navigationController?.pushViewController(PayViewController(), animated: true)
    }

    @objc func goToGeneral(){
        navigationController?.pushViewController(GeneralClass(), animated: true)
    }
}
