//
//  OfferCell.swift
//  PizzaHammer


import UIKit

class OfferCell: UICollectionViewCell {
    
    let titleLabel = UILabel()
    let productImage = UIImageView()

        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 10)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        
       
        
        productImage.contentMode = .scaleAspectFit
        
        contentView.backgroundColor = .clear
        contentView.addSubview(titleLabel)
        contentView.addSubview(productImage)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 70).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        productImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        
        productImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func configure(with title: String, image: UIImage?){
        
        titleLabel.text = title
        productImage.image = image
    }

}
