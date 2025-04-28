//
//  efmeViewController.swift
//  Momentum

import UIKit

class PayViewController: UIViewController {
    
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
    
    lazy var payStack = UIStackView()
    
    lazy var pay = UIButton()
    lazy var making = UIButton()
    
    let card = UIButton()
    let sbpQr = UIButton()
    let courierCard = UIButton()
    
    let cardField = UIView()
    let sbpQrField = UIView()
    let courierField = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        view.addSubview(frontImage)
        view.addSubview(backButton)
        view.addSubview(topLabel)
        view.addSubview(infoLabel)
        view.addSubview(pay)
        view.addSubview(making)
        view.addSubview(payStack)
        cardSetup()
        setupQrSbp()
        setupCourier()
        
        
        //MARK: Кнопка Назад
        backButton.setImage(UIImage(systemName: "arrowshape.left.fill"), for: .normal)
        backButton.tintColor = UIColor.white
        backButton.addTarget(self, action: #selector(goToProduction), for: .touchUpInside)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -5).isActive = true
        backButton.trailingAnchor.constraint(equalTo: topLabel.leadingAnchor, constant: 10).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 65).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        
        //MARK: Лейбл Оформление
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.text = "Оплата"
        topLabel.font = .systemFont(ofSize: 20, weight: .medium)
        
        topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45).isActive = true
        topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 17).isActive = true
        
        
        infoLabel.text = "Выберите способ оплаты"
        infoLabel.font = .systemFont(ofSize: 25)
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.topAnchor.constraint(equalTo: frontImage.bottomAnchor, constant: 10).isActive = true
        infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        
        //MARK: Оплата
        pay.setTitle("Оплатить", for: .normal)
        pay.backgroundColor = .systemBrown
        pay.layer.cornerRadius = 17
        pay.addTarget(self, action: #selector(goToFinalVC), for: .touchUpInside)
        
        pay.translatesAutoresizingMaskIntoConstraints = false
        pay.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        pay.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        pay.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        
        
        //MARK: Возврат на Стор
        making.setTitle("Вернуться к покупкам", for: .normal)
        making.backgroundColor = .brown
        making.layer.cornerRadius = 17
        
        making.translatesAutoresizingMaskIntoConstraints = false
        making.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        making.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        making.bottomAnchor.constraint(equalTo: pay.topAnchor, constant: -10).isActive = true
        making.addTarget(self, action: #selector(goToStore), for: .touchUpInside)
        
        //MARK: Стек методов
        payStack.axis = .vertical
        payStack.spacing = 5
        payStack.alignment = .leading
        payStack.distribution = .fillEqually
        
        payStack.addArrangedSubview(card)
        payStack.addArrangedSubview(sbpQr)
        payStack.addArrangedSubview(courierCard)
        
        
        payStack.translatesAutoresizingMaskIntoConstraints = false
        payStack.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 10).isActive = true
        payStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        payStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        
        
        //MARK: оплата
        card.setTitle("Оплата картой онлайн", for: .normal)
        card.setTitleColor(.black, for: .normal)
        card.setTitleColor(.systemGray3, for: .highlighted)
        card.addTarget(self, action: #selector(goToCardPay), for: .touchUpInside)
        
        sbpQr.setTitle("QR Или СБП", for: .normal)
        sbpQr.setTitleColor(.black, for: .normal)
        sbpQr.setTitleColor(.systemGray3, for: .highlighted)
        sbpQr.addTarget(self, action: #selector(goToSbpPay), for: .touchUpInside)
        
        courierCard.setTitle("При получении", for: .normal)
        courierCard.setTitleColor(.black, for: .normal)
        courierCard.setTitleColor(.systemGray3, for: .highlighted)
        courierCard.addTarget(self, action: #selector(goToCourierPay), for: .touchUpInside)
    }
    
    // MARK: СЕТАП ДЛЯ КАРТЫ
    func cardSetup(){
        
        let numberCard = UITextField()
        numberCard.backgroundColor = .systemMint
        numberCard.borderStyle = .bezel
        
        let dateCard = UITextField()
        dateCard.backgroundColor = .systemMint
        dateCard.borderStyle = .bezel
        
        let nameCard = UITextField()
        nameCard.backgroundColor = .systemMint
        nameCard.borderStyle = .bezel
        
        let cvv = UITextField()
        cvv.backgroundColor = .systemMint
        cvv.borderStyle = .bezel
        
        cardField.addSubview(numberCard)
        cardField.addSubview(dateCard)
        cardField.addSubview(nameCard)
        cardField.addSubview(cvv)
        
        numberCard.translatesAutoresizingMaskIntoConstraints = false
        numberCard.topAnchor.constraint(equalTo: cardField.topAnchor, constant: 25).isActive = true
        numberCard.leadingAnchor.constraint(equalTo: cardField.leadingAnchor, constant: 15).isActive = true
        numberCard.trailingAnchor.constraint(equalTo: cardField.trailingAnchor, constant: -50).isActive = true
        
        dateCard.translatesAutoresizingMaskIntoConstraints = false
        dateCard.topAnchor.constraint(equalTo: numberCard.bottomAnchor, constant: 10).isActive = true
        dateCard.leadingAnchor.constraint(equalTo: cardField.leadingAnchor, constant: 5).isActive = true
        
        nameCard.translatesAutoresizingMaskIntoConstraints = false
        nameCard.bottomAnchor.constraint(equalTo: cardField.bottomAnchor, constant: -5).isActive = true
        nameCard.trailingAnchor.constraint(equalTo: cardField.trailingAnchor, constant: -30).isActive = true
    
        cvv.translatesAutoresizingMaskIntoConstraints = false
        cvv.centerXAnchor.constraint(equalTo: cardField.centerXAnchor).isActive = true
        cvv.centerYAnchor.constraint(equalTo: cardField.centerYAnchor).isActive = true
        
        
        view.addSubview(cardField)
        cardField.isHidden = true
        cardField.translatesAutoresizingMaskIntoConstraints = false
        cardField.topAnchor.constraint(equalTo: payStack.bottomAnchor, constant: 5).isActive = true
        cardField.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        cardField.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        cardField.bottomAnchor.constraint(equalTo: making.topAnchor).isActive = true
    }
    
    func setupQrSbp(){
        
        let button = UIButton()
        button.setTitle("Перейти в банковское приложение", for: .normal)
        button.backgroundColor = .systemBrown
        button.layer.cornerRadius = 17
        
        sbpQrField.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: sbpQrField.topAnchor, constant: 30).isActive = true
        button.leadingAnchor.constraint(equalTo: sbpQrField.leadingAnchor, constant: 15).isActive = true
        button.trailingAnchor.constraint(equalTo: sbpQrField.trailingAnchor, constant: -15).isActive = true
        
        
        view.addSubview(sbpQrField)
        sbpQrField.isHidden = true
        sbpQrField.translatesAutoresizingMaskIntoConstraints = false
        sbpQrField.topAnchor.constraint(equalTo: payStack.bottomAnchor, constant: 5).isActive = true
        sbpQrField.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        sbpQrField.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        sbpQrField.bottomAnchor.constraint(equalTo: making.topAnchor).isActive = true
    }
    
    func setupCourier(){
        
        let label = UILabel()
        label.text = "Оплата при получении :)"
        label.textColor = .black
        label.font = .systemFont(ofSize: 25)
        
        courierField.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: courierField.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: courierField.centerYAnchor).isActive = true
        
        view.addSubview(courierField)
        courierField.isHidden = true
        courierField.translatesAutoresizingMaskIntoConstraints = false
        courierField.topAnchor.constraint(equalTo: payStack.bottomAnchor, constant: 5).isActive = true
        courierField.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        courierField.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        courierField.bottomAnchor.constraint(equalTo: making.topAnchor).isActive = true
    }
    
    
    
    @objc func goToProduction(){
        navigationController?.pushViewController(Production(), animated: true)
    }
    
    @objc func goToStore(){
        navigationController?.pushViewController(StoreViewController(), animated: true)
    }
    
    @objc func goToFinalVC(){
        navigationController?.pushViewController(FinalViewController(), animated: true)
    }
    
    @objc func goToCardPay(){
        
        cardField.isHidden = false
        sbpQrField.isHidden = true
        courierField.isHidden = true
    }
    
    @objc func goToSbpPay(){
        
        sbpQrField.isHidden = false
        cardField.isHidden = true
        courierField.isHidden = true
    }
    
    @objc func goToCourierPay(){
        courierField.isHidden = false
        cardField.isHidden = true
        sbpQrField.isHidden = true
    }
}
