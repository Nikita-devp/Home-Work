//
//  StoreViewController.swift
//  Momentum

import UIKit

class StoreViewController: UIViewController {
    
    let scrollView = UIScrollView()
    
    let contentView = UIView()

    lazy var frontImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = .init(x: 0, y: -100, width: 400, height: 160)
        imageView.backgroundColor = .systemBrown
        imageView.contentMode = .scaleAspectFit
        return imageView
        }()

    lazy var backButton = UIButton()
    lazy var searchLine = UISearchBar()
    
    lazy var coffeeStack = UIStackView()
    
    lazy var coffeeLabel = UILabel()
    lazy var coffeeColdButton = UIButton()
    lazy var coffeeHotButton = UIButton()
    
    
    lazy var teaStack = UIStackView()
    
    lazy var teaLabel = UILabel()
    lazy var teaGreen = UIButton()
    lazy var teaBlack = UIButton()
    lazy var teaGrass = UIButton()
    
    lazy var drinkStack = UIStackView()
    
    lazy var drinkLabel = UILabel()
    lazy var drinkGas = UIButton()
    lazy var drinkNoGas = UIButton()
    
    lazy var foodLabel = UILabel()
    
    lazy var priceCard = UIButton()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        view.addSubview(priceCard)
        contentView.addSubview(frontImage)
        contentView.addSubview(backButton)
        contentView.addSubview(searchLine)
        contentView.addSubview(coffeeStack)
        contentView.addSubview(teaStack)
        contentView.addSubview(drinkStack)
        contentView.addSubview(foodLabel)

        setupCofee()
        setupTea()
        setupJuice()
        setupFood()
        
        
        //MARK: Попытка сделать скролл на экран
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: priceCard.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
                                    
        
        //MARK: Кнопка в корзину
        priceCard.setImage(UIImage(systemName: "cart"), for: .normal)
        priceCard.backgroundColor = .brown
        priceCard.tintColor = .white
        
        priceCard.translatesAutoresizingMaskIntoConstraints = false
        priceCard.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: .zero).isActive = true
        priceCard.heightAnchor.constraint(equalToConstant: 60).isActive = true
        priceCard.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        priceCard.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        //MARK: строка поиска
        searchLine.placeholder = "Найти"
        searchLine.backgroundColor = .white
        searchLine.barTintColor = .gray
        searchLine.layer.cornerRadius = 8
        searchLine.searchBarStyle = .minimal
        
        searchLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        searchLine.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
        searchLine.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 65),
        searchLine.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -15),
        searchLine.heightAnchor.constraint(equalToConstant: 38)
        
        ])
        
        
        //MARK: кнопка назад
        backButton.setImage(UIImage(systemName: "arrowshape.left.fill"), for: .normal)
        backButton.tintColor = UIColor.white
        backButton.addTarget(self, action: #selector(goToGeneralVC), for: .touchUpInside)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        backButton.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: -5),
        backButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
        backButton.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .zero),
        backButton.widthAnchor.constraint(equalToConstant: 65),
        backButton.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        
        //MARK: Кофе стек
        coffeeStack.axis = .horizontal
        coffeeStack.spacing = 20
        coffeeStack.distribution = .fillEqually
        
        coffeeStack.addArrangedSubview(coffeeLabel)
        coffeeStack.addArrangedSubview(coffeeHotButton)
        coffeeStack.addArrangedSubview(coffeeColdButton)
        
        coffeeStack.translatesAutoresizingMaskIntoConstraints = false
        coffeeStack.topAnchor.constraint(equalTo: frontImage.bottomAnchor, constant: 5).isActive = true
        coffeeStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        
        coffeeLabel.text = "Кофе"
        coffeeLabel.font = .systemFont(ofSize: 25)
        coffeeLabel.textColor = .black
        coffeeLabel.leadingAnchor.constraint(equalTo: coffeeStack.leadingAnchor, constant: 10).isActive = true
        
        coffeeHotButton.setTitle("Горячий", for: .normal)
        coffeeHotButton.backgroundColor = .systemGray6
        coffeeHotButton.setTitleColor(.systemGray, for: .normal)
        coffeeHotButton.setTitleColor(.green, for: .highlighted)
        coffeeHotButton.layer.cornerRadius = 15
        coffeeHotButton.leadingAnchor.constraint(equalTo: coffeeLabel.trailingAnchor, constant: 10).isActive = true
        
        coffeeColdButton.setTitle("Холодный", for: .normal)
        coffeeColdButton.backgroundColor = .systemGray6
        coffeeColdButton.setTitleColor(.systemGray, for: .normal)
        coffeeColdButton.layer.cornerRadius = 15
        coffeeColdButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35).isActive = true
        
        
        //MARK: Чай стек
        teaStack.axis = .horizontal
        teaStack.spacing = 20
        teaStack.distribution = .fillEqually
        
        teaStack.addArrangedSubview(teaLabel)
        teaStack.addArrangedSubview(teaGreen)
        teaStack.addArrangedSubview(teaBlack)
        teaStack.addArrangedSubview(teaGrass)
        
        teaStack.translatesAutoresizingMaskIntoConstraints = false
        teaStack.topAnchor.constraint(equalTo: coffeeLabel.bottomAnchor, constant: 330).isActive = true
        teaStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        
        teaLabel.text = "Чай"
        teaLabel.font = .systemFont(ofSize: 25)
        teaLabel.textColor = .black
        teaLabel.leadingAnchor.constraint(equalTo: teaStack.leadingAnchor, constant: 10).isActive = true
        teaLabel.trailingAnchor.constraint(equalTo: teaGreen.leadingAnchor, constant: -25).isActive = true
        
        teaGreen.setTitle("Зеленый", for: .normal)
        teaGreen.backgroundColor = .systemGray6
        teaGreen.setTitleColor(.systemGray, for: .normal)
        teaGreen.layer.cornerRadius = 15
        teaGreen.trailingAnchor.constraint(equalTo: teaBlack.leadingAnchor, constant: -5).isActive = true
        
        teaBlack.setTitle("Черный", for: .normal)
        teaBlack.backgroundColor = .systemGray6
        teaBlack.setTitleColor(.systemGray, for: .normal)
        teaBlack.layer.cornerRadius = 15
        teaBlack.trailingAnchor.constraint(equalTo: teaGrass.leadingAnchor, constant: -5).isActive = true
        
        teaGrass.setTitle("Травяной", for: .normal)
        teaGrass.backgroundColor = .systemGray6
        teaGrass.setTitleColor(.systemGray, for: .normal)
        teaGrass.layer.cornerRadius = 15
        teaGrass.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true

        
        //MARK: Напитки стек
        drinkStack.axis = .horizontal
        drinkStack.spacing = 20
        drinkStack.distribution = .fillEqually
        
        drinkStack.translatesAutoresizingMaskIntoConstraints = false
        drinkStack.topAnchor.constraint(equalTo: teaStack.bottomAnchor, constant: 330).isActive = true
        drinkStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        
        drinkStack.addArrangedSubview(drinkLabel)
        drinkStack.addArrangedSubview(drinkGas)
        drinkStack.addArrangedSubview(drinkNoGas)
        
        drinkLabel.text = "Напитки"
        drinkLabel.font = .systemFont(ofSize: 25)
        drinkLabel.textColor = .black
        drinkLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        drinkLabel.trailingAnchor.constraint(equalTo: drinkGas.leadingAnchor, constant: -25).isActive = true
        
        drinkGas.setTitle("С газом", for: .normal)
        drinkGas.backgroundColor = .systemGray6
        drinkGas.setTitleColor(.systemGray, for: .normal)
        drinkGas.layer.cornerRadius = 15
        drinkGas.trailingAnchor.constraint(equalTo: drinkNoGas.leadingAnchor, constant: -5).isActive = true
        
        drinkNoGas.setTitle("Без газа", for: .normal)
        drinkNoGas.backgroundColor = .systemGray6
        drinkNoGas.setTitleColor(.systemGray, for: .normal)
        drinkNoGas.layer.cornerRadius = 15
        drinkNoGas.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true

        
        //MARK: Еда лейбл
        foodLabel.text = "Фастфуд"
        foodLabel.font = .systemFont(ofSize: 25)
        foodLabel.textColor = .black
        
        foodLabel.translatesAutoresizingMaskIntoConstraints = false
        foodLabel.topAnchor.constraint(equalTo: drinkStack.bottomAnchor, constant: 330).isActive = true
        foodLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        
    }
   
    
    private func setupCofee(){
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let capucinoCard = createProductCard(name: "Капучино", price: "300₽", image: UIImage(named: "Capucino"))
        let latteCard = createProductCard(name: "Латте", price: "300₽", image: UIImage(named: "Latte"))
        
        stackView.addArrangedSubview(capucinoCard)
        stackView.addArrangedSubview(latteCard)
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: coffeeStack.bottomAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: teaStack.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        latteCard.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 200).isActive = true
        
    }
    
    
    private func setupTea(){
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let blackTeaCard = createProductCard(name: "Черный чай", price: "300₽", image: UIImage(named: "BlackTea"))
        let BerryTeaCard = createProductCard(name: "Ягодный чай", price: "300₽", image: UIImage(named: "BerryTea"))
        
        stackView.addArrangedSubview(blackTeaCard)
        stackView.addArrangedSubview(BerryTeaCard)
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: teaStack.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        BerryTeaCard.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 200).isActive = true
        
    }
    
    private func setupJuice(){
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let appleJuiceCard = createProductCard(name: "Яблочный сок", price: "200₽", image: UIImage(named: "AppleJuice"))
        let orangeJuiceCard = createProductCard(name: "Апельсиновый сок", price: "200₽", image: UIImage(named: "OrangeJuice"))
        
        stackView.addArrangedSubview(appleJuiceCard)
        stackView.addArrangedSubview(orangeJuiceCard)
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: drinkStack.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        orangeJuiceCard.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 200).isActive = true
    }
    
    
    private func setupFood(){
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let burgerCard = createProductCard(name: "Бургер", price: "500₽", image: UIImage(named: "Burger"))
        let sendwichCard = createProductCard(name: "Сендвич", price: "500₽", image: UIImage(named: "Sandwich"))
        
        stackView.addArrangedSubview(burgerCard)
        stackView.addArrangedSubview(sendwichCard)
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
          stackView.topAnchor.constraint(equalTo: foodLabel.bottomAnchor, constant: 30),
          stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
          stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        sendwichCard.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 200).isActive = true
    }
    
    private func createProductCard(name: String, price: String, image: UIImage?) -> UIView {
        
        let cardView = UIView()
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 5
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        
        let nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        let priceLabel = UILabel()
        priceLabel.text = price
        priceLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        let addButton = UIButton()
        addButton.setTitleColor(.black, for: .normal)
        addButton.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        addButton.tintColor = UIColor.brown
        addButton.addTarget(self, action: #selector(addCard), for: .touchUpInside)
        
        let cardStackView = UIStackView(arrangedSubviews: [imageView, nameLabel, priceLabel, addButton])
        cardStackView.axis = .vertical
        cardStackView.spacing = 5
        
        cardStackView.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.addSubview(cardStackView)
        
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        addButton.trailingAnchor.constraint(equalTo: cardStackView.leadingAnchor, constant: 300).isActive = true
        
        NSLayoutConstraint.activate([
            cardStackView.topAnchor.constraint(equalTo: cardView.topAnchor),
            cardStackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            cardStackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
            cardStackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10)
            ])
        
        return cardView
    }
    
    @objc func goToGeneralVC(){
        navigationController?.pushViewController(GeneralClass(), animated: true)
    }
    
    @objc func addCard(){
        print("Donavleno v card")
    }
    
}
    

