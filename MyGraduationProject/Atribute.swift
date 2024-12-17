import UIKit

class AtributeButton: UIButton {
    init( title: String?,
          icon: UIImage?
        ) {
            super.init(frame: .zero)
            self.setTitle(title, for: .normal)
            self.setTitleColor(.black, for: .normal)
            self.setImage(icon, for: .normal)
            self.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
            self.tintColor = .black
            
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
