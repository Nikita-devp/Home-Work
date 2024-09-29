//
//  CEll.swift
//  HW14
//
//  Created by Злата Лашкевич on 30.09.24.
//

import UIKit

final class Cell: UICollectionViewCell {

    private let labelMarkAuto : UILabel = {
        let labelMarkAuto = UILabel()
        labelMarkAuto.textColor = .black
        labelMarkAuto.textAlignment = .center
        return labelMarkAuto
    }()

    private let ImageMarkAuto : UIImageView = {
        let ImageMarkAuto = UIImageView()
        ImageMarkAuto.contentMode = .scaleAspectFit
        return ImageMarkAuto
    }()
    
    private let StackMarkAuto : UIStackView = {
        let StackMarkAuto = UIStackView()
        StackMarkAuto.axis = .vertical
        StackMarkAuto.distribution = .fillEqually
        return StackMarkAuto
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(StackMarkAuto)
        StackMarkAuto.addArrangedSubview(ImageMarkAuto)
        StackMarkAuto.addArrangedSubview(labelMarkAuto)
        StackMarkAuto.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([widthAnchor.constraint(equalToConstant: 150)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configuration(ImageMarkAutoLogo: UIImage, labelMarkAutoName: String){
        ImageMarkAuto.image = ImageMarkAutoLogo
        labelMarkAuto.text = labelMarkAutoName
    }
    
    override func prepareForReuse() {
        ImageMarkAuto.image = nil
        
    }
}
