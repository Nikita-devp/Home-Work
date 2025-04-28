//
//  OfferCell.swift
//  Momentum

import UIKit

class OfferCell: UICollectionViewCell {
    
    let titleLabel = UILabel()
    let secondaryLabel = UILabel()
    let priceLabel = UILabel()
    let productImage = UIImageView()

        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        
        secondaryLabel.font = UIFont.systemFont(ofSize: 20)
        secondaryLabel.textAlignment = .left
        secondaryLabel.numberOfLines = 3
        secondaryLabel.textColor = .white
        
        priceLabel.font = UIFont.systemFont(ofSize: 20)
        priceLabel.font = UIFont.boldSystemFont(ofSize: 25)
        priceLabel.textAlignment = .center
        priceLabel.textColor = .white
        
        productImage.contentMode = .scaleAspectFit
        
        contentView.backgroundColor = .clear
        contentView.addSubview(titleLabel)
        contentView.addSubview(secondaryLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(productImage)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 70).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        secondaryLabel.translatesAutoresizingMaskIntoConstraints = false
        secondaryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        secondaryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        secondaryLabel.trailingAnchor.constraint(equalTo: productImage.leadingAnchor).isActive = true
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        productImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 35).isActive = true
        
        productImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func configure(with title: String, secondary: String, price: String, image: UIImage?){
        
        titleLabel.text = title
        secondaryLabel.text = secondary
        priceLabel.text = price
        productImage.image = image
    }

}
