//
//  DetailsViewController.swift
//  Momentum
//
//  Created by Злата Лашкевич on 25.04.25.
//

//import UIKit
//
//class DetailsViewController: UIViewController {
//
//    lazy var frontImage: UIImageView = {
//        let imageView = UIImageView()
//        imageView.frame = .init(x: 0, y: 0, width: 400, height: 120)
//        imageView.backgroundColor = .systemBrown
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//    
//    
//    var titleText: String?
//    var descriptionText: String?
//    var priceText: String?
//    var image: UIImage?
//    
//    let titleLabel = UILabel()
//    let descriptionLabel = UILabel()
//    let priceLabel = UILabel()
//    let productImageView = UIImageView()
//    let kiloo = UILabel()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = .white
//        view.addSubview(kiloo)
//        setupView()
//        configureView()
//        
//        kiloo.translatesAutoresizingMaskIntoConstraints = false
//        kiloo.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
//        kiloo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        
//        kiloo.text = "dkvjndjkvnkdj"
//        
//        
//    }
//    
//    private func setupView(){
//        
//        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
//        titleLabel.textAlignment = .center
//        
//        
//        let stackView = UIStackView(arrangedSubviews: [titleLabel])
//        stackView.axis = .vertical
//        
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        
//        view.addSubview(stackView)
//        
//        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        
//    }
//
//    
//    private func configureView(){
//        
//        titleLabel.text = titleText
//    }
//}
