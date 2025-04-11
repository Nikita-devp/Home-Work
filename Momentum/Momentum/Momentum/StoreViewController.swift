//
//  StoreViewController.swift
//  Momentum
//
//  Created by Злата Лашкевич on 18.03.25.
//
class Product {
    let name: String

    init(name: String) {
        self.name = name
    }
}

class Image {
    let image: UIImage
    
    init(image: UIImage) {
        self.image = image
    }
}


import UIKit

class StoreViewController: UIViewController {
    
    
    lazy var frontImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = .init(x: 0, y: 0, width: 400, height: 120)
        imageView.backgroundColor = .systemBrown
        imageView.contentMode = .scaleAspectFit
        return imageView
        }()
    
    lazy var generalStack = UIStackView()
    lazy var cofeeStack = UIStackView()
    lazy var teaStack = UIStackView()
    lazy var drinkStack = UIStackView()
    lazy var foodStack = UIStackView()
    
    
    lazy var searchLine = UISearchBar()
    lazy var backButton = UIButton()
    
    lazy var cofeeLabel = UILabel()
    lazy var teaLabel = UILabel()
    lazy var drinklabel = UILabel()
    lazy var foodLabel = UILabel()
    
    // позиции магаза
    let categories = [
        
        "ЧайStack": [Product(name: "Черный"), Product(name: "Ягодный")],
        "Напитки": [Product(name: "Яблочный"), Product(name: "Персиковый")],
        "Закуски": [Product(name: "Бургер"), Product(name: "Чизбургер")]
    ]
    
        var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 30
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: "ProductCell")
        
        view.addSubview(collectionView)
        
        
        view.addSubview(generalStack)
        view.addSubview(frontImage)
        view.addSubview(searchLine)
        view.addSubview(backButton)
        view.addSubview(cofeeStack)
        collectionView.addSubview(cofeeLabel)
        collectionView.addSubview(teaLabel)
        collectionView.addSubview(drinklabel)
        collectionView.addSubview(foodLabel)
        
        cofeeLabel.translatesAutoresizingMaskIntoConstraints = false
        cofeeLabel.text = "COfee"
        
        teaLabel.translatesAutoresizingMaskIntoConstraints = false
        teaLabel.text = "Tea"
        teaLabel.topAnchor.constraint(equalTo: cofeeLabel.bottomAnchor, constant: 50).isActive = true
        
        // строка поиска
        searchLine.placeholder = "Найти"
        searchLine.backgroundColor = .white
        searchLine.barTintColor = .gray
        searchLine.layer.cornerRadius = 8
        searchLine.searchBarStyle = .minimal
        
        searchLine.translatesAutoresizingMaskIntoConstraints = false
        searchLine.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        searchLine.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 65).isActive = true
        searchLine.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        searchLine.heightAnchor.constraint(equalToConstant: 38).isActive = true
        
        
        // кнопка назад
        backButton.setImage(UIImage(systemName: "arrowshape.left.fill"), for: .normal)
        backButton.tintColor = UIColor.white
        backButton.addTarget(self, action: #selector(goToGeneralVC), for: .touchUpInside)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -10).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        backButton.trailingAnchor.constraint(equalTo: searchLine.leadingAnchor, constant: .zero).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 65).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        
        
}
    @objc func goToGeneralVC(){
        navigationController?.pushViewController(GeneralClass(), animated: true)
    }
}

extension StoreViewController: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let category = Array(categories.values)[section]
        return category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        let category = Array(categories.values)[indexPath.section]
        let product = category[indexPath.item]
        cell.configure(with: product)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 20) / 2
        return CGSize(width: width, height: 100)
    }
    
}

class ProductCell: UICollectionViewCell {
    
    let nameLabel = UILabel()
    let addButton = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        addButton.setTitle("добавить в корзину", for: .normal)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(addButton)
        
        nameLabel.textAlignment = .center
        addButton.backgroundColor = .systemGreen
        addButton.setTitleColor(.white, for: .normal)
        
        
        NSLayoutConstraint.activate([
                    nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
                    nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                    nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                    
                    addButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
                    addButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                    addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                    addButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
                ])

        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with product: Product) {
        nameLabel.text = product.name
    }
}
