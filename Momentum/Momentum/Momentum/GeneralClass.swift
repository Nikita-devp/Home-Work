//
//  ViewController.swift
//  Momentum
//
//  Created by Nikita Hoishyk on 18.03.25.
//

import UIKit

class GeneralClass: UIViewController {
    
    lazy var frontImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = .init(x: 0, y: 0, width: 400, height: 250)
        imageView.backgroundColor = .systemBrown
        imageView.contentMode = .scaleAspectFit
        return imageView
        }()
    
    lazy var specialImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = .init(x: 0, y: 200, width: 400, height: 200)
        imageView.backgroundColor = .brown
        imageView.layer.cornerRadius = 22
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var shopingCart = UIButton()
    
    lazy var specialLabel = UILabel()
    
    lazy var searchLine = UISearchBar()
    
    lazy var allStoreButton = UIButton()
    
    let scrollview = UIScrollView()
    let stackChapter = UIStackView()
    
    let newButton = UIButton()
    let coffeeButton = UIButton()
    let teaButton = UIButton()
    let drinkButton = UIButton()
    let foodButton = UIButton()
    
    let newField = UIView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        
        view.addSubview(shopingCart)
        view.addSubview(frontImage)
        view.addSubview(specialImage)
        view.addSubview(specialLabel)
        view.addSubview(searchLine)
        view.addSubview(scrollview)
        scrollview.addSubview(stackChapter)
        view.addSubview(allStoreButton)
        
        
        
        //кнопка корзины
        shopingCart.setTitle("Корзина покупок", for: .normal)
        shopingCart.backgroundColor = .brown
        shopingCart.addTarget(self, action: #selector(goToShopingCart), for: .touchUpInside)
        
        
        shopingCart.translatesAutoresizingMaskIntoConstraints = false
        shopingCart.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: .zero).isActive = true
        shopingCart.heightAnchor.constraint(equalToConstant: 70).isActive = true
        shopingCart.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        shopingCart.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        // тайтл специальное предложение
        specialLabel.text = "Специальные предложения"
        specialLabel.textAlignment = .left
        specialLabel.textColor = .white
        specialLabel.font = .systemFont(ofSize: 25)
        specialLabel.numberOfLines = 2
        specialLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        specialLabel.translatesAutoresizingMaskIntoConstraints = false
        specialLabel.topAnchor.constraint(equalTo: searchLine.bottomAnchor, constant: 10).isActive = true
        specialLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        specialLabel.bottomAnchor.constraint(equalTo: specialImage.topAnchor, constant: -5).isActive = true
            
        
        // строка поиска
        searchLine.translatesAutoresizingMaskIntoConstraints = false
        searchLine.placeholder = "Найти"
        searchLine.backgroundColor = .white
        searchLine.barTintColor = .gray
        searchLine.layer.cornerRadius = 8
        searchLine.searchBarStyle = .minimal

        
        searchLine.topAnchor.constraint(equalTo: view.topAnchor, constant: 68).isActive = true
        searchLine.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        searchLine.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        searchLine.heightAnchor.constraint(equalToConstant: 38).isActive = true
        
        
        // кнопка перехода в основное меню
        
        allStoreButton.setTitle("Посмотреть все товары", for: .normal)
        allStoreButton.backgroundColor = .systemBrown
        allStoreButton.layer.cornerRadius = 17
        allStoreButton.addTarget(self, action: #selector(goToStoreVC), for: .touchUpInside)
        
        allStoreButton.translatesAutoresizingMaskIntoConstraints = false
        allStoreButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        allStoreButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        allStoreButton.bottomAnchor.constraint(equalTo: shopingCart.topAnchor, constant: -10).isActive = true
        
        
        // стек из разделов
        stackChapter.addArrangedSubview(newButton)
        stackChapter.addArrangedSubview(coffeeButton)
        stackChapter.addArrangedSubview(teaButton)
        stackChapter.addArrangedSubview(drinkButton)
        stackChapter.addArrangedSubview(foodButton)
        
        
        stackChapter.axis = .horizontal
        stackChapter.spacing = 10
        stackChapter.alignment = .center
        stackChapter.distribution = .fillEqually

        
        newButton.setTitle("New", for: .normal)
        newButton.setTitleColor(.white, for: .normal)
        newButton.backgroundColor = .systemBrown
        newButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        newButton.layer.cornerRadius = 8
        
        coffeeButton.setTitle("Кофе", for: .normal)
        coffeeButton.setTitleColor(.gray, for: .normal)
        coffeeButton.backgroundColor = .systemGray5
        coffeeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        coffeeButton.layer.cornerRadius = 8
        
        teaButton.setTitle("Чай", for: .normal)
        teaButton.setTitleColor(.gray, for: .normal)
        teaButton.backgroundColor = .systemGray5
        teaButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        teaButton.layer.cornerRadius = 8
        
        drinkButton.setTitle("Напитки", for: .normal)
        drinkButton.setTitleColor(.gray, for: .normal)
        drinkButton.backgroundColor = .systemGray5
        drinkButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        drinkButton.layer.cornerRadius = 8
        
        foodButton.setTitle("Фастфуд", for: .normal)
        foodButton.setTitleColor(.gray, for: .normal)
        foodButton.backgroundColor = .systemGray5
        foodButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        foodButton.layer.cornerRadius = 8
        
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollview.topAnchor.constraint(equalTo: specialImage.bottomAnchor, constant: 20),
            scrollview.bottomAnchor.constraint(equalTo: allStoreButton.topAnchor, constant: -20),
            scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
//            scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // Настраиваем stackChapter
        stackChapter.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackChapter.topAnchor.constraint(equalTo: scrollview.topAnchor),
            stackChapter.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            stackChapter.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            stackChapter.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor),
            stackChapter.widthAnchor.constraint(equalTo: scrollview.widthAnchor) // Ограничение ширины
        ])
        
    }
    
    func setupUI(){
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
//        let capucinoCard =
        
        
    }
    
    func createProductCard(name: String, price: String, image: UIImage?) -> UIView {
        
        let cardView = UIView()
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 5
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        let nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        let priceLabel = UILabel()
        priceLabel.text = price
        priceLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        let addButton = UIButton()
        
        return cardView
    }

    @objc func goToStoreVC(){
        navigationController?.pushViewController(StoreViewController(), animated: true)
    }
    
    @objc func goToShopingCart(){
        navigationController?.pushViewController(ShopingCart(), animated: true)
    }
}

