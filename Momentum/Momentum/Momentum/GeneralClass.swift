//
//  ViewController.swift
//  Momentum
//
//  Created by Nikita Hoishyk on 18.03.25.

import UIKit

class GeneralClass: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    lazy var frontImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = .init(x: 0, y: 0, width: 400, height: 250)
        imageView.backgroundColor = .systemBrown
        imageView.contentMode = .scaleAspectFit
        return imageView
        }()
    
    lazy var specialImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = .init(x: 0, y: 180, width: 400, height: 200)
        imageView.backgroundColor = .brown
        imageView.layer.cornerRadius = 22
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var shopingCart = UIButton()
    
    lazy var specialLabel = UILabel()
    
    lazy var searchLine = UISearchBar()
    
    lazy var allStoreButton = UIButton()
    
    let stackChapter = UIStackView()
    
    let newButton = UIButton()
    let coffeeButton = UIButton()
    let teaButton = UIButton()
    let drinkButton = UIButton()
    let foodButton = UIButton()
    
    let cofeeField = UIView()
    let teaField = UIView()
    let juiceField = UIView()
    let foodField = UIView()
    
    var productsInCart: [Product] = []
    
    var offers: [(title: String, secondary: String, price: String, image: UIImage?)] = [
        ("Ice Latte","Новый кофе по супер низкой цене!","150₽",UIImage(named: "Latte")),
        ("Капучино","Новый кофе по супер низкой цене!","150₽", UIImage(named: "Capucino"))
    ]
    var collectionView: UICollectionView!
    var pageControll: UIPageControl!
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.isHidden = true
        view.addSubview(shopingCart)
        view.addSubview(frontImage)
        view.addSubview(specialImage)
        view.addSubview(specialLabel)
        view.addSubview(searchLine)
        view.addSubview(stackChapter)
        view.addSubview(allStoreButton)
        setupCofee()
        setupTea()
        setupJuice()
        setupFood()
        
        setupCollection()
        setupPageControll()
        startTimer()
        
        
        //MARK: кнопка корзины
        shopingCart.setTitle("Корзина покупок", for: .normal)
        shopingCart.backgroundColor = .brown
        shopingCart.addTarget(self, action: #selector(goToShopingCart), for: .touchUpInside)
        
        
        shopingCart.translatesAutoresizingMaskIntoConstraints = false
        shopingCart.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: .zero).isActive = true
        shopingCart.heightAnchor.constraint(equalToConstant: 70).isActive = true
        shopingCart.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        shopingCart.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        //MARK: тайтл специальное предложение
        specialLabel.text = "Специальные предложения"
        specialLabel.textAlignment = .left
        specialLabel.textColor = .white
        specialLabel.font = .systemFont(ofSize: 25)
        specialLabel.numberOfLines = 2
        specialLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        specialLabel.translatesAutoresizingMaskIntoConstraints = false
        specialLabel.topAnchor.constraint(equalTo: searchLine.bottomAnchor, constant: 5).isActive = true
        specialLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        specialLabel.bottomAnchor.constraint(equalTo: specialImage.topAnchor, constant: -5).isActive = true
            
        
        //MARK: строка поиска
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
        
        
        //MARK: кнопка перехода в основное меню
        
        allStoreButton.setTitle("Посмотреть все товары", for: .normal)
        allStoreButton.backgroundColor = .systemBrown
        allStoreButton.layer.cornerRadius = 17
        allStoreButton.addTarget(self, action: #selector(goToStoreVC), for: .touchUpInside)
        
        allStoreButton.translatesAutoresizingMaskIntoConstraints = false
        allStoreButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        allStoreButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        allStoreButton.bottomAnchor.constraint(equalTo: shopingCart.topAnchor, constant: -10).isActive = true
        
        
        //MARK: стек из разделов
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
        coffeeButton.addTarget(self, action: #selector(cofeeToShow), for: .touchUpInside)
        
        teaButton.setTitle("Чай", for: .normal)
        teaButton.setTitleColor(.gray, for: .normal)
        teaButton.backgroundColor = .systemGray5
        teaButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        teaButton.layer.cornerRadius = 8
        teaButton.addTarget(self, action: #selector(teaToShow), for: .touchUpInside)
        
        drinkButton.setTitle("Напитки", for: .normal)
        drinkButton.setTitleColor(.gray, for: .normal)
        drinkButton.backgroundColor = .systemGray5
        drinkButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        drinkButton.layer.cornerRadius = 8
        drinkButton.addTarget(self, action: #selector(juiceToShow), for: .touchUpInside)
        
        foodButton.setTitle("Фастфуд", for: .normal)
        foodButton.setTitleColor(.gray, for: .normal)
        foodButton.backgroundColor = .systemGray5
        foodButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        foodButton.layer.cornerRadius = 8
        foodButton.addTarget(self, action: #selector(foodToShow), for: .touchUpInside)

        stackChapter.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackChapter.topAnchor.constraint(equalTo: specialImage.bottomAnchor, constant: 5),
            stackChapter.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
        ])
        
    }
    
    private func setupCofee(){
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let capucinoCard = createProductCard(name: "Капучино", price: "300₽", image: UIImage(named: "Capucino"))
        capucinoCard.addTarget(self, action: #selector(goToCapucino), for: .touchUpInside)
        
        let latteCard = createProductCard(name: "Латте", price: "300₽", image: UIImage(named: "Latte"))
        latteCard.addTarget(self, action: #selector(goToLatte), for: .touchUpInside)
    
        
        stackView.addArrangedSubview(capucinoCard)
        stackView.addArrangedSubview(latteCard)
        
        cofeeField.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: cofeeField.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: cofeeField.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: cofeeField.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: cofeeField.trailingAnchor)
        ])
        
        latteCard.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 200).isActive = true
        
        view.addSubview(cofeeField)
        cofeeField.isHidden = true
        cofeeField.translatesAutoresizingMaskIntoConstraints = false
        cofeeField.topAnchor.constraint(equalTo: specialImage.bottomAnchor, constant: 55).isActive = true
        cofeeField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
        cofeeField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        cofeeField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
    }
    
    private func setupTea(){
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let blackTeaCard = createProductCard(name: "Черный чай", price: "200₽", image: UIImage(named: "BlackTea"))
        blackTeaCard.addTarget(self, action: #selector(goToBlackTea), for: .touchUpInside)
        
        let berryTeaeCard = createProductCard(name: "Ягодный чай", price: "200₽", image: UIImage(named: "BerryTea"))
        berryTeaeCard.addTarget(self, action: #selector(goToGrassTea), for: .touchUpInside)
        
        stackView.addArrangedSubview(blackTeaCard)
        stackView.addArrangedSubview(berryTeaeCard)
        
        teaField.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: teaField.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: teaField.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: teaField.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: teaField.trailingAnchor)
        ])
        
        berryTeaeCard.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 200).isActive = true
        
        view.addSubview(teaField)
        teaField.isHidden = true
        teaField.translatesAutoresizingMaskIntoConstraints = false
        teaField.topAnchor.constraint(equalTo: specialImage.bottomAnchor, constant: 55).isActive = true
        teaField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
        teaField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        teaField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        
    }
    
    private func setupJuice(){
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let appleJuiceCard = createProductCard(name: "Яблочный сок", price: "200₽", image: UIImage(named: "AppleJuice"))
        appleJuiceCard.addTarget(self, action: #selector(goToAppleJuice), for: .touchUpInside)
        
        let orangeJuiceCard = createProductCard(name: "Апельсиновый сок", price: "200₽", image: UIImage(named: "OrangeJuice"))
        orangeJuiceCard.addTarget(self, action: #selector(goToOrangeJuice), for: .touchUpInside)
        
        stackView.addArrangedSubview(appleJuiceCard)
        stackView.addArrangedSubview(orangeJuiceCard)
        
        juiceField.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: juiceField.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: juiceField.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: juiceField.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: juiceField.trailingAnchor)
        ])
        
        orangeJuiceCard.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 200).isActive = true
        
        view.addSubview(juiceField)
        juiceField.isHidden = true
        juiceField.translatesAutoresizingMaskIntoConstraints = false
        juiceField.topAnchor.constraint(equalTo: specialImage.bottomAnchor, constant: 55).isActive = true
        juiceField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
        juiceField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        juiceField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true

    }
    
    
    private func setupFood(){
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let burgerCard = createProductCard(name: "Бургер", price: "500₽", image: UIImage(named: "Burger"))
        burgerCard.addTarget(self, action: #selector(goToBurger), for: .touchUpInside)
        
        let sendwichCard = createProductCard(name: "Сендвич", price: "500₽", image: UIImage(named: "Sandwich"))
        sendwichCard.addTarget(self, action: #selector(goToSandwich), for: .touchUpInside)
        
        stackView.addArrangedSubview(burgerCard)
        stackView.addArrangedSubview(sendwichCard)
        
        foodField.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: foodField.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: foodField.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: foodField.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: foodField.trailingAnchor)
        ])
        
        sendwichCard.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 200).isActive = true
        
        view.addSubview(foodField)
        foodField.isHidden = true
        foodField.translatesAutoresizingMaskIntoConstraints = false
        foodField.topAnchor.constraint(equalTo: specialImage.bottomAnchor, constant: 55).isActive = true
        foodField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
        foodField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        foodField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        
    }

    private func createProductCard(name: String, price: String, image: UIImage?) -> UIButton {
        
        let cardView = UIButton()
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
        addButton.addTarget(self, action: #selector(addTocart(_:)), for: .touchUpInside)
        
        addButton.tag = name.hashValue
        
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
    
    func setupCollection(){
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.register(OfferCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: specialLabel.bottomAnchor, constant: 12).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setupPageControll(){
        
        pageControll = UIPageControl()
        pageControll.numberOfPages = offers.count
        pageControll.currentPage = 0
        
        view.addSubview(pageControll)
        
        pageControll.translatesAutoresizingMaskIntoConstraints = false
        pageControll.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10).isActive = true
        pageControll.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func startTimer(){
        
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(nextOffer), userInfo: nil, repeats: true)
    }
    
    @objc func nextOffer(){
        
        let currentIndex = Int(collectionView.contentOffset.x / collectionView.frame.width)
        let nextIndex = (currentIndex + 1) % offers.count
        let indexPath = IndexPath(item: nextIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControll.currentPage = nextIndex
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return offers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? OfferCell else {
            return UICollectionViewCell()
        }
        
        let offer = offers[indexPath.item]
        cell.configure(with: offer.title, secondary: offer.secondary, price: offer.price, image: offer.image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDecelerating scrollView: UIScrollView) {
        let currentIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControll.currentPage = currentIndex
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    deinit {
        timer?.invalidate()
    }

    @objc func goToStoreVC(){
        navigationController?.pushViewController(StoreViewController(), animated: true)
    }
    
    @objc func goToShopingCart(){
        navigationController?.pushViewController(ShopingCart(), animated: true)
    }
    
    @objc func addTocart(){
        print("Donavleno v card")
    }
    
    @objc func goToCapucino(){
        navigationController?.pushViewController(CapucinoViewController(), animated: true)
    }
    
    @objc func goToLatte(){
        navigationController?.pushViewController(LatteViewController(), animated: true)
    }
    
    @objc func goToBlackTea(){
        navigationController?.pushViewController(BlackTeaViewController(), animated: true)
    }
    
    @objc func goToGrassTea(){
        navigationController?.pushViewController(GrassViewController(), animated: true)
    }
    
    @objc func goToOrangeJuice(){
        navigationController?.pushViewController(OrangeJuiceViewController(), animated: true)
    }
    
    @objc func goToAppleJuice(){
        navigationController?.pushViewController(AppleJuiceViewController(), animated: true)
    }
    
    @objc func goToBurger(){
        navigationController?.pushViewController(BurgerViewController(), animated: true)
    }
    
    @objc func goToSandwich(){
        navigationController?.pushViewController(SandwichViewController(), animated: true)
    }
    
    @objc func cofeeToShow(){
        cofeeField.isHidden = false
        teaField.isHidden = true
        juiceField.isHidden = true
        foodField.isHidden = true
        
    }
    
    @objc func teaToShow(){
        cofeeField.isHidden = true
        teaField.isHidden = false
        juiceField.isHidden = true
        foodField.isHidden = true
        
    }
    
    @objc func juiceToShow(){
        cofeeField.isHidden = true
        teaField.isHidden = true
        juiceField.isHidden = false
        foodField.isHidden = true
        
    }
    
    @objc func foodToShow(){
        cofeeField.isHidden = true
        teaField.isHidden = true
        juiceField.isHidden = true
        foodField.isHidden = false
        
    }
    
    @objc private func addTocart(_ sender: UIButton) {
        let productName: String
        let productPrice: String
        let productImage: UIImage?
        
        switch sender.tag {
        case "Капучино".hashValue: // capucino
            productName = "Капучино"
            productPrice = "300₽"
            productImage = UIImage(named: "Capucino")
        case "Латте".hashValue: // latte
            productName = "Латте"
            productPrice = "300₽"
            productImage = UIImage(named: "Latte")
        case "Черный чай".hashValue: // black tea
            productName = "Черный чай"
            productPrice = "200₽"
            productImage = UIImage(named: "BlackTea")
        case "Ягодный чай".hashValue: // berry tea
            productName = "Ягодный чай"
            productPrice = "200₽"
            productImage = UIImage(named: "BerryTea")
        case "Апельсиновый сок".hashValue: // orange juice
            productName = "Апельсиновый сок"
            productPrice = "200₽"
            productImage = UIImage(named: "AppleJuice")
        case "Яблочный сок".hashValue: // apple juice
            productName = "Яблочный сок"
            productPrice = "200₽"
            productImage = UIImage(named: "OrangeJuice")
        case "Бургер".hashValue: // burger
            productName = "Бургер"
            productPrice = "500₽"
            productImage = UIImage(named: "Burger")
        case "Сендвич".hashValue: // sandwich
            productName = "Сендвич"
            productPrice = "500₽"
            productImage = UIImage(named: "Sandwich")
            
        default:
            return
        }
        
        let product = Product(name: productName, price: productPrice, image: productImage)
        Cart.shared.addProduct(product)
        
        print("\(product.name) добавлен в корзину")
    }

}
