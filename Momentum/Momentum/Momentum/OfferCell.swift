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
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        
        secondaryLabel.font = UIFont.systemFont(ofSize: 17)
        secondaryLabel.textAlignment = .center
        secondaryLabel.numberOfLines = 0
        secondaryLabel.textColor = .white
        
        priceLabel.font = UIFont.systemFont(ofSize: 20)
        priceLabel.textAlignment = .center
        priceLabel.textColor = .white
        
        productImage.contentMode = .scaleAspectFit
        
        
        let stackview = UIStackView(arrangedSubviews: [ titleLabel, secondaryLabel, priceLabel, productImage])
        stackview.axis = .vertical
        stackview.spacing = 5
        stackview.backgroundColor = .brown
        stackview.translatesAutoresizingMaskIntoConstraints = false

        
        contentView.addSubview(stackview)
        
        stackview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackview.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
    func configure(with title: String, secondary: String, price: String, image: UIImage?){
        
        titleLabel.text = title
        secondaryLabel.text = secondary
        priceLabel.text = price
        productImage.image = image
    }

}
