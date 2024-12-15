import UIKit
import FirebaseAuth

class RegisterView: UIView {
    // MARK: - Elements
    
    weak var delegate: AuthViewDelegate?
    
    lazy var fieldsStackView: UIStackView = .init()
    
    lazy var loginField: UITextField  = {
        let field = UITextField()
        field.placeholder = "Login"
        field.keyboardType = .emailAddress
        return field
     }()
   
    lazy var passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.keyboardType = .numberPad
        field.isSecureTextEntry = true
        return field
    }()
    
    lazy var nameField: UITextField  = {
        let field = UITextField()
        field.placeholder = "Name"
        field.keyboardType = .emailAddress
        return field
     }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(
            type: .system,
            primaryAction: UIAction(
                handler: { [weak self] _ in
                    self?.registerButtonDidTap()
                }
            )
       )
       button.setTitle("Go", for: .normal)
       return button
    }()
    
    lazy var errorLabel: UILabel = .init()
    
    init() {
        super.init(frame: .zero)
        print("view is loaded")
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
    private func setupView() {
        backgroundColor = .white
        
        errorLabel.isHidden = false
        
        let buttons = UIStackView(arrangedSubviews: [registerButton])
        buttons.distribution = .equalCentering
        buttons.spacing = 10
        
        fieldsStackView.alignment = .center
        fieldsStackView.axis = .vertical
        fieldsStackView.spacing = 10
        fieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        fieldsStackView.addArrangedSubview(loginField)
        fieldsStackView.addArrangedSubview(passwordField)
        fieldsStackView.addArrangedSubview(errorLabel)
        fieldsStackView.addArrangedSubview(nameField)
        fieldsStackView.addArrangedSubview(buttons)
        
        addSubview(fieldsStackView)
        
        NSLayoutConstraint.activate([
            fieldsStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            fieldsStackView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            fieldsStackView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    
    // MARK: - Actions
    
    func registerButtonDidTap() {
        guard let name = nameField.text else { return }
        let user = User(name)
        guard let result = delegate?.register(
            login: loginField.text,
            password: passwordField.text, user: user
        ) else { return }
        
        switch result {
        case .success:
            errorLabel.text = nil
            errorLabel.isHidden = true
        case let .failure(error):
            errorLabel.isHidden = false
            errorLabel.text = error.errorMessage
            break
        }
    }
}
