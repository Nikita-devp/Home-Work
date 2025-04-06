//
//  21412ViewController.swift
//  Momentum
//
//  Created by Злата Лашкевич on 20.03.25.
//

import UIKit

class Product {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class ProductViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let categories = [
        "Кофе": [Product(name: "Эспрессо"), Product(name: "Капучино")],
        "Чай": [Product(name: "Черный чай"), Product(name: "Зеленый чай")],
        "Напитки": [Product(name: "Сок"), Product(name: "Газировка")],
        "Еда": [Product(name: "Сэндвич"), Product(name: "Салат")]
    ]
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 20
        
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: "ProductCell")
        
        self.view.addSubview(collectionView)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let category = Array(categories.values)[section]
        return category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        let category = Array(categories.values)[indexPath.section]
        let product = category[indexPath.item]
        cell.configurationState
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 30) / 2 // 2 items per row with spacing
        return CGSize(width: width, height: 100)
    }
}

class ProductCell: UICollectionViewCell {
    
    let nameLabel = UILabel()
    let addButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        addButton.setTitle("Добавить в корзину", for: .normal)
        
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
}


