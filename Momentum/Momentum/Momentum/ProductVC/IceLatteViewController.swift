//
//  LatteViewController.swift
//  Momentum

import UIKit

class IceLatteViewController: UIViewController {

    lazy var frontImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = .init(x: 0, y: 0, width: 400, height: 120)
        imageView.backgroundColor = .systemBrown
        imageView.contentMode = .scaleAspectFit
        return imageView
        }()
    
    
    lazy var backButton = UIButton()
    lazy var topLabel = UILabel()
    
    lazy var capucinoStack = UIStackView()
    lazy var imageView = UIImageView(image: UIImage(named: "IceLatteinStore"))
    lazy var nameLabel = UILabel()
    lazy var priceLabel = UILabel()
    
    lazy var text = UILabel()
    
    lazy var kBJUStack = UIStackView()
    lazy var ml = UILabel()
    lazy var kbju = UILabel()
    lazy var type = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(frontImage)
        view.addSubview(backButton)
        view.addSubview(topLabel)
        view.addSubview(capucinoStack)
        view.addSubview(imageView)
        view.addSubview(text)
        view.addSubview(kBJUStack)
        
        
        //MARK: Кнопка Назад
        backButton.setImage(UIImage(systemName: "arrowshape.left.fill"), for: .normal)
        backButton.tintColor = UIColor.white
        backButton.addTarget(self, action: #selector(goToShopingCart), for: .touchUpInside)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -10).isActive = true
        backButton.trailingAnchor.constraint(equalTo: topLabel.leadingAnchor, constant: 10).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 65).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        
        //MARK: Лейбл Оформление
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.text = "Ice Latte"
        topLabel.font = .systemFont(ofSize: 20, weight: .medium)
        
        topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45).isActive = true
        topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        
        
        //MARK: Картинка
        imageView.layer.cornerRadius = 2
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: frontImage.bottomAnchor, constant: 5).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        
        //MARK: стек на капучино
        capucinoStack.axis = .vertical
        capucinoStack.distribution = .fillEqually
        capucinoStack.spacing = 5
        
        
        capucinoStack.addArrangedSubview(nameLabel)
        capucinoStack.addArrangedSubview(priceLabel)
        
        capucinoStack.translatesAutoresizingMaskIntoConstraints = false
        capucinoStack.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        capucinoStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        capucinoStack.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        nameLabel.text = "IceLatte"
        nameLabel.font = .systemFont(ofSize: 25)
        nameLabel.font = .boldSystemFont(ofSize: 20)
        
        priceLabel.text = "150₽"
        priceLabel.font = .systemFont(ofSize: 25)
        priceLabel.textColor = .brown
        
        
        //MARK: Описание
        text.text = "Освежающий и ароматный ледяной латте - идеальное сочетание холодного молока, крепкого кофе и льда, которое прекрасно подойдет для освежения в жаркий день.!"
        text.textColor = .black
        text.numberOfLines = 20
        
        text.translatesAutoresizingMaskIntoConstraints = false
        text.topAnchor.constraint(equalTo: capucinoStack.bottomAnchor, constant: 5).isActive = true
        text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        text.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        
        //MARK: стек на кбжу
        kBJUStack.axis = .horizontal
        kBJUStack.spacing = 20
        
        kBJUStack.translatesAutoresizingMaskIntoConstraints = false
        kBJUStack.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 10).isActive = true
        kBJUStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        
        kBJUStack.addArrangedSubview(ml)
        kBJUStack.addArrangedSubview(kbju)
        kBJUStack.addArrangedSubview(type)
        
        ml.text = "380 МЛ"
        ml.font = .systemFont(ofSize: 10)
        ml.font = .boldSystemFont(ofSize: 20)
        ml.textColor = .brown
        
        kbju.text = "КБЖУ 20/5/20/15"
        kbju.font = .systemFont(ofSize: 10)
        kbju.font = .boldSystemFont(ofSize: 20)
        kbju.textColor = .brown
        kbju.leadingAnchor.constraint(equalTo: ml.trailingAnchor, constant: 15).isActive = true
        
        type.text = "Арабика"
        type.font = .systemFont(ofSize: 10)
        type.font = .boldSystemFont(ofSize: 20)
        type.textColor = .brown
    }
    
    
    @objc func goToShopingCart(){
        navigationController?.pushViewController(GeneralClass(), animated: true)
    }
    
}

