//
//  CreateTargetViewController.swift
//  MyGraduationProject
//
//  Created by Злата Лашкевич on 15.12.24.
//

import UIKit
import ContactsUI

protocol CreateTargetViewControllerDelegate: AnyObject {
    func didCreateTarget(name: String, date: Date, contact: Target.Contact?)
}

class CreateTargetViewController: UIViewController, CNContactPickerDelegate {
    
    lazy var contactsController: CNContactPickerViewController = .init()
    
    var presenter: CreateTargetPresenter?
    
    private var selectedContact: Target.Contact? {
        didSet {
            selectedContactLabel.text = selectedContact?.name
            selectedContactLabel.isHidden = false
        }
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Создать цель"
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    lazy var selectedContactLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.isHidden = true
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите название цели"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton(primaryAction: .init(handler: { [weak self] _ in
            guard let self else { return }
            guard let text = self.nameTextField.text, !text.isEmpty else { return }
            self.presenter?.createButttonDidTap(
                with: text,
                date: self.datePicker.date,
                contact: self.selectedContact
            )
        }))
        button.setTitle("Сохранить", for
                        : .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy var selectContactButton: UIButton = .init(configuration: .bordered(), primaryAction: UIAction(title: "Выбрать контакт", handler: { [weak self] _ in
        self?.openContacts()
    }))
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.minimumDate = .now
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.setCustomSpacing(16, after: titleLabel)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(datePicker)
        stackView.addArrangedSubview(selectedContactLabel)
        stackView.addArrangedSubview(selectContactButton)
        stackView.addArrangedSubview(saveButton)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
        // Do any additional setup after loading the view.
    }
    
    
    func openContacts() {
        contactsController.delegate = self
        present(contactsController, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        if let actualNumber = contact.phoneNumbers.first?.value as? CNPhoneNumber {
             selectedContact = Target.Contact(
                name: contact.givenName + " " + contact.familyName,
                phone: actualNumber.stringValue
            )
        }
    }

}
