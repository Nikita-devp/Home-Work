//override func viewDidLoad() {
//    super.viewDidLoad()
//    view.backgroundColor = .white
//    navigationItem.hidesBackButton = true
//
//    // Добавляем все элементы на экран
//    view.addSubview(shopingCart)
//    view.addSubview(frontImage)
//    view.addSubview(specialImage)
//    view.addSubview(specialLabel)
//    view.addSubview(searchLine)
//    view.addSubview(scrollview)
//    scrollview.addSubview(stackChapter)
//    view.addSubview(allStoreButton)
//
//    // Настраиваем кнопку корзины
//    shopingCart.setTitle("Корзина покупок", for: .normal)
//    shopingCart.backgroundColor = .brown
//    shopingCart.addTarget(self, action: #selector(goToShopingCart), for: .touchUpInside)
//    
//    shopingCart.translatesAutoresizingMaskIntoConstraints = false
//    // Устанавливаем ограничения для кнопки корзины
//    NSLayoutConstraint.activate([
//        shopingCart.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//        shopingCart.heightAnchor.constraint(equalToConstant: 70),
//        shopingCart.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//        shopingCart.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//    ])
//    
//    // Настраиваем специальный заголовок
//    specialLabel.text = "Специальные предложения"
//    specialLabel.textAlignment = .left
//    specialLabel.textColor = .white
//    specialLabel.font = .systemFont(ofSize: 25)
//    specialLabel.numberOfLines = 2
//    specialLabel.translatesAutoresizingMaskIntoConstraints = false
//    
//    NSLayoutConstraint.activate([
//        specialLabel.topAnchor.constraint(equalTo: searchLine.bottomAnchor, constant: 10),
//        specialLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//        specialLabel.bottomAnchor.constraint(equalTo: specialImage.topAnchor, constant: -5)
//    ])
//    
//    // Настраиваем строку поиска
//    searchLine.translatesAutoresizingMaskIntoConstraints = false
//    searchLine.placeholder = "Найти"
//    searchLine.backgroundColor = .white
//    searchLine.barTintColor = .gray
//    searchLine.layer.cornerRadius = 8
//    searchLine.searchBarStyle = .minimal
//    
//    NSLayoutConstraint.activate([
//        searchLine.topAnchor.constraint(equalTo: view.topAnchor, constant: 68),
//        searchLine.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
//        searchLine.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
//        searchLine.heightAnchor.constraint(equalToConstant: 38)
//    ])
//    
//    // Настраиваем кнопку для перехода в основное меню
//    allStoreButton.setTitle("Посмотреть все товары", for: .normal)
//    allStoreButton.backgroundColor = .systemBrown
//    allStoreButton.layer.cornerRadius = 17
//    allStoreButton.addTarget(self, action: #selector(goToStoreVC), for: .touchUpInside)
//    
//    allStoreButton.translatesAutoresizingMaskIntoConstraints = false
//    NSLayoutConstraint.activate([
//        allStoreButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//        allStoreButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
//        allStoreButton.bottomAnchor.constraint(equalTo: shopingCart.topAnchor, constant: -10)
//    ])
//    
//    // Настраиваем стек из разделов
//    stackChapter.axis = .horizontal
//    stackChapter.spacing = 10
//    stackChapter.alignment = .center
//    stackChapter.distribution = .fillEqually
//    
//    stackChapter.addArrangedSubview(newButton)
//    stackChapter.addArrangedSubview(coffeeButton)
//    stackChapter.addArrangedSubview(teaButton)
//    stackChapter.addArrangedSubview(drinkButton)
//    stackChapter.addArrangedSubview(foodButton)
//
//    // Настраиваем кнопки
//    setupButton(newButton, title: "New", backgroundColor: .systemBrown)
//    setupButton(coffeeButton, title: "Кофе", backgroundColor: .systemGray5)
//    setupButton(teaButton, title: "Чай", backgroundColor: .systemGray5)
//    setupButton(drinkButton, title: "Напитки", backgroundColor: .systemGray5)
//    setupButton(foodButton, title: "Фастфуд", backgroundColor: .systemGray5)
//
//    // Настраиваем scrollview
//    scrollview.translatesAutoresizingMaskIntoConstraints = false
//    NSLayoutConstraint.activate([
//        scrollview.topAnchor.constraint(equalTo: specialImage.bottomAnchor, constant: 20),
//        scrollview.bottomAnchor.constraint(equalTo: allStoreButton.topAnchor, constant: -20),
//        scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
//        scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//    ])
//    
//    // Настраиваем stackChapter
//    stackChapter.translatesAutoresizingMaskIntoConstraints = false
//    NSLayoutConstraint.activate([
//        stackChapter.topAnchor.constraint(equalTo: scrollview.topAnchor),
//        stackChapter.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
//        stackChapter.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
//        stackChapter.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor),
//        stackChapter.widthAnchor.constraint(equalTo: scrollview.widthAnchor) // Ограничение ширины
//    ])
//}
//
//private func setupButton(_ button: UIButton, title: String, backgroundColor: UIColor) {
//    button.setTitle(title, for: .normal)
//    button.setTitleColor(.white, for: .normal)
//    button.backgroundColor = backgroundColor
//    button.heightAnchor.constraint(equalToConstant: 40).isActive = true
//    button.layer.cornerRadius = 8
//}
