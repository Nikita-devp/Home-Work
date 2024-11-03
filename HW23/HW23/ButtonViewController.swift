//
//  ButtonViewController.swift
//  HW23
//
//  Created by Злата Лашкевич on 3.11.24.
//

import UIKit

class ButtonViewController: UIButton {
    
    enum constraintss{
        static let buttonWidth: CGFloat = 40
        static let buttonHeight: CGFloat = 40
    }

    let image: UIImage?
    
    init(image: UIImage?) {
        self.image = image
        super.init(frame: .zero)
        buttonseting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonseting(){
        setBackgroundImage(image, for: .normal)
        widthAnchor.constraint(equalToConstant: constraintss.buttonWidth).isActive = true
        heightAnchor.constraint(equalToConstant: constraintss.buttonHeight).isActive = true
    }

}
