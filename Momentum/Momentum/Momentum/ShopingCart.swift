//
//  ShopingCart.swift
//  Momentum

struct Product {
    let name: String
    let price: String
    let image: UIImage?
}

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
        navigationController?.navigationBar.isHidden = true
        view.addSubview(frontImage)
        view.addSubview(backButton)
        view.addSubview(topLabel)
        view.addSubview(making)
        view.addSubview(store)
        view.addSubview(comentary)
        view.addSubview(number)
        view.addSubview(name)
        view.addSubview(cart)
        
        updateCart()
        
        
        //MARK: кнопка назад
        backButton.setImage(UIImage(systemName: "arrowshape.left.fill"), for: .normal)
        backButton.tintColor = UIColor.white
        backButton.addTarget(self, action: #selector(goToGeneral), for: .touchUpInside)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -5).isActive = true
        backButton.trailingAnchor.constraint(equalTo: topLabel.leadingAnchor, constant: 10).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 65).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        
        //MARK: Лейбл
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.text = "Корзина"
        topLabel.font = .systemFont(ofSize: 20, weight: .medium)
        topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45).isActive = true
        topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 17).isActive = true
        
        
        //MARK: оформление
        making.setTitle("Оформление заказа", for: .normal)
        making.backgroundColor = .systemBrown
        making.layer.cornerRadius = 17
        
        making.translatesAutoresizingMaskIntoConstraints = false
        making.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        making.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        making.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        making.addTarget(self, action: #selector(goToProduction), for: .touchUpInside)
        
        
        //MARK: к покупкам
        store.setTitle("Вернуться к покупкам", for: .normal)
        store.backgroundColor = .brown
        store.layer.cornerRadius = 17
        
        store.translatesAutoresizingMaskIntoConstraints = false
        store.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        store.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        store.bottomAnchor.constraint(equalTo: making.topAnchor, constant: -10).isActive = true
        store.addTarget(self, action: #selector(goToStore), for: .touchUpInside)
        
    
        //MARK: комм
        comentary.borderStyle = .roundedRect
        comentary.placeholder = "Введите коментарий"
        comentary.translatesAutoresizingMaskIntoConstraints = false
        comentary.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        comentary.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        comentary.bottomAnchor.constraint(equalTo: store.topAnchor, constant: -15).isActive = true
        
        
        //MARK: номер
        number.borderStyle = .roundedRect
        number.keyboardType = .namePhonePad
        number.placeholder = "Введите номер телефона"
        
        number.translatesAutoresizingMaskIntoConstraints = false
        number.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        number.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        number.bottomAnchor.constraint(equalTo: comentary.topAnchor, constant: -15).isActive = true
        
        
        //MARK: имя
        name.borderStyle = .roundedRect
        name.placeholder = "Введите Имя"
        
        name.translatesAutoresizingMaskIntoConstraints = false
        name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        name.bottomAnchor.constraint(equalTo: number.topAnchor, constant: -15).isActive = true
        
        
        //MARK: корзина
        cart.axis = .vertical
        cart.spacing = 10
        cart.alignment = .leading
        cart.distribution = .fillEqually
        
        cart.translatesAutoresizingMaskIntoConstraints = false
        cart.topAnchor.constraint(equalTo: frontImage.bottomAnchor).isActive = true
        cart.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        cart.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
    
    private func createProductView(product: Product) -> UIView {
        
        let productView = UIView()
        productView.backgroundColor = .systemGray6
        productView.layer.cornerRadius = 8
        
        let imageView = UIImageView(image: product.image)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        
        
        let nameLabel = UILabel()
        nameLabel.text = product.name
        nameLabel.font = .systemFont(ofSize: 20, weight: .medium)
        
        let priceLabel = UILabel()
        priceLabel.text = product.price
        priceLabel.font = .systemFont(ofSize: 14, weight: .bold)
        priceLabel.textColor = .brown
        
        let stackView = UIStackView(arrangedSubviews: [imageView, nameLabel, priceLabel])
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        productView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: productView.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: productView.trailingAnchor, constant: -10).isActive = true
        stackView.topAnchor.constraint(equalTo: productView.topAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: productView.bottomAnchor, constant: -10).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.leadingAnchor.constraint(equalTo: productView.leadingAnchor).isActive = true
        
        priceLabel.bottomAnchor.constraint(equalTo: productView.bottomAnchor, constant: 30).isActive = true
        
        return productView
    }
    
    private func updateCart(){
        cart.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for product in Cart.shared.products {
            let productView = createProductView(product: product)
            cart.addArrangedSubview(productView)
        }
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
