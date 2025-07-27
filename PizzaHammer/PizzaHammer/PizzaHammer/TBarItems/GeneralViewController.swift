//
//  GeneralViewController.swift
//  PizzaHammer


import UIKit

class GeneralViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var offers: [(title: String, image: UIImage?)] = [ ("акция",UIImage(named: "baner1")), ("action",UIImage(named: "baner2"))]
    
    var collectionView: UICollectionView!
    var pageControll: UIPageControl!
    var timer: Timer?
    
    
    let pizzaButton = UIButton()
    let comboButton = UIButton()
    let cakeButton = UIButton()
    let drinkButton = UIButton()
    
    lazy var frontImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = .init(x: -7, y: 300, width: 408, height: 860)
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 40
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let scrollChapterVIew = UIScrollView()
    let contentchapterView = UIView()
    
    let stackChapter = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        
        view.addSubview(contentView)
        view.addSubview(scrollChapterVIew)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        //MARK: Скролл чаптеров
        scrollChapterVIew.addSubview(contentchapterView)
        [stackChapter].forEach {
            contentchapterView.addSubview($0)
        }
        
        setupPizza()
        setupCollection()
        setupPageControll()
        startTimer()
    
        
        //MARK: Скролл всего экрана
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: stackChapter.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
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
        
        
        
        scrollChapterVIew.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollChapterVIew.topAnchor.constraint(equalTo: pageControll.bottomAnchor),
            scrollChapterVIew.bottomAnchor.constraint(equalTo: pageControll.bottomAnchor, constant: 54),
            scrollChapterVIew.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollChapterVIew.trailingAnchor.constraint(equalTo: view.trailingAnchor)
                ])
                
        contentchapterView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentchapterView.topAnchor.constraint(equalTo: scrollChapterVIew.topAnchor),
            contentchapterView.bottomAnchor.constraint(equalTo: scrollChapterVIew.bottomAnchor),
            contentchapterView.leadingAnchor.constraint(equalTo: scrollChapterVIew.leadingAnchor),
            contentchapterView.trailingAnchor.constraint(equalTo: scrollChapterVIew.trailingAnchor),
            contentchapterView.heightAnchor.constraint(greaterThanOrEqualTo: scrollChapterVIew.heightAnchor)
                ])
        
        
        
        //MARK: стек из разделов
        stackChapter.addArrangedSubview(pizzaButton)
        stackChapter.addArrangedSubview(comboButton)
        stackChapter.addArrangedSubview(cakeButton)
        stackChapter.addArrangedSubview(drinkButton)
        
        
        stackChapter.axis = .horizontal
        stackChapter.spacing = 10
        stackChapter.alignment = .center
        stackChapter.distribution = .fillEqually
        
        
        pizzaButton.setTitle("Пицца", for: .normal)
        pizzaButton.setTitleColor(.systemPink, for: .normal)
        pizzaButton.backgroundColor = .systemGray5
        pizzaButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        pizzaButton.widthAnchor.constraint(equalToConstant: 110).isActive = true
        pizzaButton.layer.cornerRadius = 17
        
        comboButton.setTitle("Комбо", for: .normal)
        comboButton.setTitleColor(.systemPink, for: .normal)
        comboButton.backgroundColor = .systemGray5
        comboButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        comboButton.layer.cornerRadius = 17

        cakeButton.setTitle("Десерты", for: .normal)
        cakeButton.setTitleColor(.systemPink, for: .normal)
        cakeButton.backgroundColor = .systemGray5
        cakeButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        cakeButton.layer.cornerRadius = 17

        drinkButton.setTitle("Напитки", for: .normal)
        drinkButton.setTitleColor(.systemPink, for: .normal)
        drinkButton.backgroundColor = .systemGray5
        drinkButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        drinkButton.layer.cornerRadius = 17
        
        stackChapter.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackChapter.topAnchor.constraint(equalTo: contentchapterView.topAnchor),
            stackChapter.bottomAnchor.constraint(equalTo: contentchapterView.bottomAnchor),
            stackChapter.leadingAnchor.constraint(equalTo: contentchapterView.leadingAnchor),
            stackChapter.trailingAnchor.constraint(equalTo: contentchapterView.trailingAnchor)
        ])
        
    }

    //MARK: ---- Сетапы ----
    func setupCollection(){
            
        let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
            
            collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
            collectionView.register(OfferCell.self, forCellWithReuseIdentifier: "cell")
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.isPagingEnabled = true
            collectionView.backgroundColor = UIColor.clear
            
            view.addSubview(collectionView)
            
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 45).isActive = true
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            collectionView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        }
    
    private func setupPizza() {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let pizza1Card = createProductCard(name: "Ветчина и грибы", price: "от 355 р", image: UIImage(named: "pizza1"))
        let pizza2Card = createProductCard(name: "Баварские колбаски", price: "от 345 р", image: UIImage(named: "pizza1"))
        let pizza3Card = createProductCard(name: "Нежный лосось", price: "от 345 р", image: UIImage(named: "pizza1"))
        let pizza4Card = createProductCard(name: "Четыре сыра", price: "от 355 р", image: UIImage(named: "pizza4"))
        let pizza5Card = createProductCard(name: "Четыре сыра", price: "от 355 р", image: UIImage(named: "pizza4"))
        let pizza6Card = createProductCard(name: "Четыре сыра", price: "от 355 р", image: UIImage(named: "pizza4"))
        let pizza7Card = createProductCard(name: "Четыре сыра", price: "от 355 р", image: UIImage(named: "pizza4"))
        let pizza8Card = createProductCard(name: "Четыре сыра", price: "от 355 р", image: UIImage(named: "pizza4"))
        let pizza9Card = createProductCard(name: "Четыре сыра", price: "от 355 р", image: UIImage(named: "pizza4"))
        let pizza10Card = createProductCard(name: "Четыре сыра", price: "от 355 р", image: UIImage(named: "pizza4"))
        let pizza11Card = createProductCard(name: "Четыре сыра", price: "от 355 р", image: UIImage(named: "pizza4"))
        
        stackView.addArrangedSubview(pizza1Card)
        stackView.addArrangedSubview(pizza2Card)
        stackView.addArrangedSubview(pizza3Card)
        stackView.addArrangedSubview(pizza4Card)
        stackView.addArrangedSubview(pizza5Card)
        stackView.addArrangedSubview(pizza6Card)
        stackView.addArrangedSubview(pizza7Card)
        stackView.addArrangedSubview(pizza8Card)
        stackView.addArrangedSubview(pizza9Card)
        stackView.addArrangedSubview(pizza10Card)
        stackView.addArrangedSubview(pizza11Card)
        
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    
func setupPageControll(){
            
    pageControll = UIPageControl()
    pageControll.numberOfPages = offers.count
    pageControll.currentPage = 0
    pageControll.pageIndicatorTintColor = .gray
    pageControll.currentPageIndicatorTintColor = .systemPink
            
        view.addSubview(pageControll)
            
        pageControll.translatesAutoresizingMaskIntoConstraints = false
        pageControll.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10).isActive = true
        pageControll.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
        
func startTimer(){
            
    timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(nextOffer), userInfo: nil, repeats: true)
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
            cell.configure(with: offer.title, image: offer.image)
            
            cell.backgroundColor = UIColor.clear
            cell.contentView.backgroundColor = UIColor.clear
            cell.backgroundView?.backgroundColor = UIColor.clear
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

    
    private func createProductCard(name: String, price: String, image: UIImage?) -> UIButton {
        
        let cardView = UIButton()
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 5
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        
        let nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        let priceLabel = UILabel()
        priceLabel.text = price
        priceLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        
        let cardStackView = UIStackView(arrangedSubviews: [imageView, nameLabel, priceLabel])
        cardStackView.axis = .horizontal
        cardStackView.spacing = 10
        
        cardStackView.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.addSubview(cardStackView)
        
        imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        NSLayoutConstraint.activate([
            cardStackView.topAnchor.constraint(equalTo: cardView.topAnchor),
            cardStackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            cardStackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
            cardStackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor)
        ])
        
        return cardView
    }

    
}
