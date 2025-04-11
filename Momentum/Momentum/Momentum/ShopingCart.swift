//
//  ShopingCart.swift
//  Momentum
//
//  Created by Злата Лашкевич on 6.04.25.
//

import UIKit

class ShopingCart: UIViewController {
    
    lazy var frontImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = .init(x: 0, y: 0, width: 400, height: 120)
        imageView.backgroundColor = .systemBrown
        imageView.contentMode = .scaleAspectFit
        return imageView
        }()
    
    lazy var backButton = UIButton()
    lazy var topLabel = UILabel()
    lazy var infoLabel = UILabel()
    lazy var making = UIButton()
    lazy var store = UIButton()
    lazy var comentary = UITextField()
    lazy var number = UITextField()
    lazy var name = UITextField()
    
    lazy var cart = UIStackView()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        view.addSubview(frontImage)
        view.addSubview(backButton)
        view.addSubview(topLabel)
        view.addSubview(making)
        view.addSubview(store)
        view.addSubview(comentary)
        view.addSubview(number)
        view.addSubview(name)
        view.addSubview(cart)
        
        
        
        
        backButton.setImage(UIImage(systemName: "arrowshape.left.fill"), for: .normal)
        backButton.tintColor = UIColor.white
        backButton.addTarget(self, action: #selector(goToGeneral), for: .touchUpInside)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -38).isActive = true
        backButton.trailingAnchor.constraint(equalTo: topLabel.leadingAnchor, constant: 10).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 65).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        
        
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.text = "Корзина"
        topLabel.font = .systemFont(ofSize: 20, weight: .medium)
        topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45).isActive = true
        topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -15).isActive = true
        
        
        
        making.setTitle("Оформление заказа", for: .normal)
        making.backgroundColor = .systemBrown
        making.layer.cornerRadius = 17
        
        making.translatesAutoresizingMaskIntoConstraints = false
        making.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        making.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        making.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        making.addTarget(self, action: #selector(goToProduction), for: .touchUpInside)
        
        
        store.setTitle("Вернуться к покупкам", for: .normal)
        store.backgroundColor = .brown
        store.layer.cornerRadius = 17
        
        store.translatesAutoresizingMaskIntoConstraints = false
        store.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        store.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        store.bottomAnchor.constraint(equalTo: making.topAnchor, constant: -10).isActive = true
        store.addTarget(self, action: #selector(goToStore), for: .touchUpInside)
        
    
        comentary.borderStyle = .roundedRect
        comentary.placeholder = "Введите коментарий"
        comentary.translatesAutoresizingMaskIntoConstraints = false
        comentary.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        comentary.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        comentary.bottomAnchor.constraint(equalTo: store.topAnchor, constant: -15).isActive = true
        
        
        number.borderStyle = .roundedRect
        number.keyboardType = .namePhonePad
        number.placeholder = "Введите номер телефона"
        
        number.translatesAutoresizingMaskIntoConstraints = false
        number.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        number.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        number.bottomAnchor.constraint(equalTo: comentary.topAnchor, constant: -15).isActive = true
        
        
        name.borderStyle = .roundedRect
        name.placeholder = "Введите Имя"
        
        name.translatesAutoresizingMaskIntoConstraints = false
        name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        name.bottomAnchor.constraint(equalTo: number.topAnchor, constant: -15).isActive = true
        
        
        cart.axis = .vertical
        cart.spacing = 10
        cart.alignment = .leading
        cart.distribution = .fillEqually
        
        cart.translatesAutoresizingMaskIntoConstraints = false
        cart.topAnchor.constraint(equalTo: frontImage.bottomAnchor).isActive = true
        cart.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        cart.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        cart.bottomAnchor.constraint(equalTo: name.topAnchor).isActive = true
        
    }

    @objc func goToGeneral(){
        navigationController?.pushViewController(GeneralClass(), animated: true)
    }
    
    @objc func goToStore(){
        navigationController?.pushViewController(StoreViewController(), animated: true)
    }
    
    @objc func goToProduction(){
        navigationController?.pushViewController(Production(), animated: true)
    }
    
}
