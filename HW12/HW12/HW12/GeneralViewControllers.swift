//
//  ViewController.swift
//  HW12
//
//  Created by Злата Лашкевич on 21.09.24.
//

import UIKit

protocol EditViewControllerDelegate: AnyObject {
    func updateUserInfoLabel(editText: String, tag: Int)
    
}
class GeneralViewControllers: UIViewController{
    
    
    lazy var NameButton = UILabel()
    lazy var FirstNameButton = UILabel()
    lazy var AgeButton = UILabel()
    lazy var GenderButton = UILabel()
    lazy var BirthdayButton = UILabel()
    
    private let NameEditButton = UIButton()
    private let FirstnameEditButton = UIButton()
    private let AgeEditButton = UIButton()
    private let GenderEditButton = UIButton()
    private let BirthdayEditButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNameButton()
        setupFirstNameButton()
        setupAgeButton()
        setupGenderButton()
        setupBirthday()
        
        setupNameEditButoon()
        setupFirstNameEditButton()
        setupAgeEditButton()
        setupGenderEditButton()
        setupBirthdayEditButton()
        
    }
            
            
            // MARK - Функции на лейблы показа
            
    func setupNameButton() {
        view.addSubview(NameButton)
        NameButton.tag = 1
        NameButton.translatesAutoresizingMaskIntoConstraints = false
        NameButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        NameButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        NameButton.text = "Имя"
    }
            
    func setupFirstNameButton() {
        view.addSubview(FirstNameButton)
        FirstNameButton.tag = 2
        FirstNameButton.translatesAutoresizingMaskIntoConstraints = false
        FirstNameButton.topAnchor.constraint(equalTo: NameButton.bottomAnchor, constant: 15).isActive = true
        FirstNameButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        FirstNameButton.text = "Фамилия"
    }
            
    func setupAgeButton() {
        view.addSubview(AgeButton)
        AgeButton.tag = 3
        AgeButton.translatesAutoresizingMaskIntoConstraints = false
        AgeButton.topAnchor.constraint(equalTo: FirstNameButton.bottomAnchor, constant: 15).isActive = true
        AgeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        AgeButton.text = "Возраст"
    }
            
    func setupGenderButton() {
        view.addSubview(GenderButton)
        GenderButton.tag = 4
        GenderButton.translatesAutoresizingMaskIntoConstraints = false
        GenderButton.topAnchor.constraint(equalTo: AgeButton.bottomAnchor, constant: 15).isActive = true
        GenderButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        GenderButton.text = "Пол"
    }
            
    func setupBirthday() {
        view.addSubview(BirthdayButton)
        BirthdayButton.tag = 5
        BirthdayButton.translatesAutoresizingMaskIntoConstraints = false
        BirthdayButton.topAnchor.constraint(equalTo: GenderButton.bottomAnchor, constant: 15).isActive = true
        BirthdayButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        BirthdayButton.text = "День рождения"
    }
            
            //MARK - функции на кнопки изменения
            
    func setupNameEditButoon() {
        view.addSubview(NameEditButton)
        NameEditButton.translatesAutoresizingMaskIntoConstraints = false
        NameEditButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        NameEditButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        NameEditButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        NameEditButton.addTarget(self, action: #selector(editButtonTapped( _ :)), for: .touchUpInside)
    }
            
    func setupFirstNameEditButton() {
        view.addSubview(FirstnameEditButton)
        FirstnameEditButton.translatesAutoresizingMaskIntoConstraints = false
        FirstnameEditButton.topAnchor.constraint(equalTo: NameEditButton.bottomAnchor, constant: 15).isActive = true
        FirstnameEditButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        FirstnameEditButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        FirstnameEditButton.addTarget(self, action: #selector(editButtonTapped(_ :)), for: .touchUpInside)
    }
            
    func setupAgeEditButton() {
        view.addSubview(AgeEditButton)
        AgeEditButton.translatesAutoresizingMaskIntoConstraints = false
        AgeEditButton.topAnchor.constraint(equalTo: FirstnameEditButton.bottomAnchor, constant: 15).isActive = true
        AgeEditButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        AgeEditButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        AgeEditButton.addTarget(self, action: #selector(editButtonTapped(_ :)), for: .touchUpInside)
    }
            
    func setupGenderEditButton(){
        view.addSubview(GenderEditButton)
        GenderEditButton.translatesAutoresizingMaskIntoConstraints = false
        GenderEditButton.topAnchor.constraint(equalTo: AgeEditButton.bottomAnchor, constant: 15).isActive = true
        GenderEditButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        GenderEditButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        GenderEditButton.addTarget(self, action: #selector(editButtonTapped(_ :)), for: .touchUpInside)
    }
            
    func setupBirthdayEditButton() {
        view.addSubview(BirthdayEditButton)
        BirthdayEditButton.translatesAutoresizingMaskIntoConstraints = false
        BirthdayEditButton.topAnchor.constraint(equalTo: GenderEditButton.bottomAnchor, constant: 15).isActive = true
        BirthdayEditButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        BirthdayEditButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        BirthdayEditButton.addTarget(self, action: #selector(editButtonTapped(_ :)), for: .touchUpInside)
    }
            
            
            @objc func editButtonTapped(_ sender: UIButton) {
                
                var label: UILabel?
                switch sender {
                case NameEditButton:
                    label = NameButton
                case FirstnameEditButton:
                    label = FirstNameButton
                case AgeEditButton:
                    label = AgeButton
                case GenderEditButton:
                    label = GenderButton
                case BirthdayEditButton:
                    label = BirthdayButton
                default: break
                }
                
                let EditViewController = EditViewController()
                guard let selectlabel = label else {return}
                EditViewController.editString = selectlabel.text
                EditViewController.LabellTag = selectlabel.tag
                EditViewController.delegate = self
                present(EditViewController, animated: true)
            }
            
        }
        
        extension GeneralViewControllers: EditViewControllerDelegate {
            func updateUserInfoLabel(editText: String, tag: Int) {
                switch tag {
                case NameButton.tag:
                    NameButton.text = editText
                case FirstNameButton.tag:
                    FirstNameButton.text = editText
                case AgeButton.tag:
                    AgeButton.text = editText
                case GenderButton.tag:
                    GenderButton.text = editText
                case BirthdayButton.tag:
                    BirthdayButton.text = editText
                default: break
                }
            }
        }
    
