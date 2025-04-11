//
//  Production.swift
//  Momentum
//
//  Created by Злата Лашкевич on 7.04.25.
//

import UIKit

class Production: UIViewController {
    
    lazy var frontImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = .init(x: 0, y: 0, width: 400, height: 120)
        imageView.backgroundColor = .systemBrown
        imageView.contentMode = .scaleAspectFit
        return imageView
        }()
    
    
    lazy var backButton = UIButton()
    lazy var topLabel = UILabel()
    
    lazy var deliveryStack = UIStackView()
    lazy var deliveryButton = UIButton()
    lazy var deliveryPickup = UIButton()
    lazy var making = UIButton()
    lazy var pay = UIButton()
    
    lazy var deliveryField = UIView()
    
    lazy var pickupField = UIView()
    
    let dateField = UITextField()
    
    let timeField = UITextField()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        view.backgroundColor = .white
        
        view.addSubview(frontImage)
        view.addSubview(backButton)
        view.addSubview(topLabel)
        view.addSubview(deliveryStack)
        view.addSubview(making)
        view.addSubview(pay)
        setupDeliveryField()
        setupPickupField()
        
        //MARK: Кнопка Назад
        backButton.setImage(UIImage(systemName: "arrowshape.left.fill"), for: .normal)
        backButton.tintColor = UIColor.white
        backButton.addTarget(self, action: #selector(goToShopingCart), for: .touchUpInside)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -38).isActive = true
        backButton.trailingAnchor.constraint(equalTo: topLabel.leadingAnchor, constant: 10).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 65).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        
        //MARK: Лейбл Оформление
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.text = "Оформление"
        topLabel.font = .systemFont(ofSize: 20, weight: .medium)
        
        topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45).isActive = true
        topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -15).isActive = true
        
        
        // MARK: Стек Для выбора доставки самовывоза
        deliveryStack.axis = .horizontal
        deliveryStack.distribution = .fillEqually
        deliveryStack.spacing = 15
        deliveryStack.alignment = .center
        
        deliveryStack.translatesAutoresizingMaskIntoConstraints = false
        deliveryStack.topAnchor.constraint(equalTo: frontImage.bottomAnchor).isActive = true
        deliveryStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        deliveryStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        deliveryStack.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        
        deliveryStack.addArrangedSubview(deliveryButton)
        deliveryStack.addArrangedSubview(deliveryPickup)
        
        
        //MARK: Доставка
        deliveryButton.setImage(UIImage(systemName: "car.side"), for: .normal)
        deliveryButton.setTitle("Доставка", for: .normal)
        deliveryButton.tintColor = UIColor.white
        deliveryButton.backgroundColor = .brown
        deliveryButton.setTitleColor(.gray, for: .highlighted)
        deliveryButton.layer.cornerRadius = 20
        
        deliveryStack.topAnchor.constraint(equalTo: deliveryStack.topAnchor, constant: -10).isActive = true
        deliveryButton.bottomAnchor.constraint(equalTo: deliveryStack.bottomAnchor, constant: -5).isActive = true
        
        deliveryButton.addTarget(self, action: #selector(showToDelivery), for: .touchUpInside)
        
        
        //MARK: Самовывоз
        deliveryPickup.setImage(UIImage(systemName: "house"), for: .normal)
        deliveryPickup.setTitle("Самовывоз", for: .normal)
        deliveryPickup.tintColor = UIColor.white
        deliveryPickup.backgroundColor = .brown
        deliveryPickup.setTitleColor(.gray, for: .highlighted)
        deliveryPickup.layer.cornerRadius = 20
        
        deliveryPickup.topAnchor.constraint(equalTo: deliveryStack.topAnchor, constant: 5).isActive = true
        
        deliveryPickup.addTarget(self, action: #selector(showToPickup), for: .touchUpInside)
        
        
        //MARK: Оплата
        pay.setTitle("Оплатить", for: .normal)
        pay.backgroundColor = .systemBrown
        pay.layer.cornerRadius = 17
        pay.addTarget(self, action: #selector(goToPay), for: .touchUpInside)
        
        pay.translatesAutoresizingMaskIntoConstraints = false
        pay.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        pay.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        pay.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        
        
        //MARK: Возврат на Стор
        making.setTitle("Вернуться к покупкам", for: .normal)
        making.backgroundColor = .brown
        making.layer.cornerRadius = 17
        
        making.translatesAutoresizingMaskIntoConstraints = false
        making.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        making.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        making.bottomAnchor.constraint(equalTo: pay.topAnchor, constant: -10).isActive = true
        making.addTarget(self, action: #selector(goToStore), for: .touchUpInside)
        
    }
    
    //MARK: Стек для доставки
    func setupDeliveryField(){
        
        let dateLabel = UILabel()
        dateLabel.text = "Дата"
        
        dateField.placeholder = "Дата"
        dateField.borderStyle = .line
        dateField.addTarget(self, action: #selector(showDatePicker), for: .editingDidBegin)
        
        let timeLabel = UILabel()
        timeLabel.text = "Время"
        
        timeField.placeholder = "Время"
        timeField.borderStyle = .line
        timeField.addTarget(self, action: #selector(showTimePicker), for: .editingDidBegin)
        
        let countryField = UITextField()
        countryField.placeholder = "Страна"
        countryField.layer.cornerRadius = 8
        countryField.backgroundColor = .systemGray6
        
        let cityField = UITextField()
        cityField.placeholder = "Город"
        cityField.layer.cornerRadius = 8
        cityField.backgroundColor = .systemGray6
        
        let addressField = UITextField()
        addressField.placeholder = "Адрес"
        addressField.layer.cornerRadius = 8
        addressField.backgroundColor = .systemGray6
        
        deliveryField.addSubview(dateLabel)
        deliveryField.addSubview(dateField)
        deliveryField.addSubview(timeLabel)
        deliveryField.addSubview(timeField)
        deliveryField.addSubview(countryField)
        deliveryField.addSubview(cityField)
        deliveryField.addSubview(addressField)
        
        
        let deliveryFieldStack = UIStackView(arrangedSubviews: [dateLabel, dateField, timeLabel, timeField, countryField, cityField, addressField])
        
        deliveryFieldStack.axis = .vertical
        deliveryFieldStack.spacing = 15
        deliveryFieldStack.distribution = .fillEqually
        deliveryFieldStack.alignment = .leading
        
        dateLabel.topAnchor.constraint(equalTo: deliveryFieldStack.topAnchor, constant: 5).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: deliveryFieldStack.leadingAnchor, constant: 10).isActive = true
        
        dateField.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor, constant: 5).isActive = true
        
        timeLabel.topAnchor.constraint(equalTo: dateField.bottomAnchor, constant: 5).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: deliveryFieldStack.leadingAnchor, constant: 10).isActive = true
        
        timeField.leadingAnchor.constraint(equalTo: timeLabel.leadingAnchor, constant: 5).isActive = true
        
        countryField.trailingAnchor.constraint(equalTo: deliveryFieldStack.trailingAnchor, constant: -15).isActive = true
        countryField.leadingAnchor.constraint(equalTo: deliveryFieldStack.leadingAnchor, constant: 10).isActive = true
        
        cityField.trailingAnchor.constraint(equalTo: deliveryFieldStack.trailingAnchor, constant: -15).isActive = true
        cityField.leadingAnchor.constraint(equalTo: deliveryFieldStack.leadingAnchor, constant: 10).isActive = true

        addressField.trailingAnchor.constraint(equalTo: deliveryFieldStack.trailingAnchor, constant: -15).isActive = true
        addressField.leadingAnchor.constraint(equalTo: deliveryFieldStack.leadingAnchor, constant: 10).isActive = true

        
        deliveryField.addSubview(deliveryFieldStack)
        deliveryFieldStack.translatesAutoresizingMaskIntoConstraints = false
        deliveryFieldStack.leadingAnchor.constraint(equalTo: deliveryField.leadingAnchor).isActive = true
        deliveryFieldStack.trailingAnchor.constraint(equalTo: deliveryField.trailingAnchor).isActive = true
        deliveryFieldStack.topAnchor.constraint(equalTo: deliveryField.topAnchor).isActive = true
        
        deliveryField.isHidden = true
        view.addSubview(deliveryField)
        deliveryField.translatesAutoresizingMaskIntoConstraints = false
        deliveryField.topAnchor.constraint(equalTo: deliveryStack.bottomAnchor, constant: 10).isActive = true
        deliveryField.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        deliveryField.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        deliveryField.bottomAnchor.constraint(equalTo: making.topAnchor, constant: -5).isActive = true
        
    }
    
    //MARK: Стек для самовывоза
    func setupPickupField(){
        
        let dateLabel = UILabel()
        dateLabel.text = "Дата"
        
        dateField.placeholder = "Дата"
        dateField.borderStyle = .line
        dateField.addTarget(self, action: #selector(showDatePicker), for: .editingDidBegin)
        
        let timeLabel = UILabel()
        timeLabel.text = "Время"
        
        timeField.placeholder = "Время"
        timeField.borderStyle = .line
        timeField.addTarget(self, action: #selector(showTimePicker), for: .editingDidBegin)
        
        let infoLabel = UILabel()
        infoLabel.text = "Выберите удобный адрес"
        infoLabel.font = .systemFont(ofSize: 25)
        
        let adress1 = createCheckbox(title: "г. Москва, ул. Красная 82")
        
        let adress2 = createCheckbox(title: "г. Иваново, ул. Ленина 120")
        
        let adress3 = createCheckbox(title: "г. Иваново, ул. Мира 45")

        
        pickupField.addSubview(dateLabel)
        pickupField.addSubview(dateField)
        pickupField.addSubview(timeLabel)
        pickupField.addSubview(timeField)
        pickupField.addSubview(infoLabel)
        pickupField.addSubview(adress1)
        pickupField.addSubview(adress2)
        pickupField.addSubview(adress3)
        
        let pickupFieldStack = UIStackView(arrangedSubviews: [dateLabel, dateField, timeLabel, timeField, infoLabel, adress1, adress2, adress3])
        
        pickupFieldStack.axis = .vertical
        pickupFieldStack.distribution = .fillEqually
        pickupFieldStack.alignment = .leading
        pickupFieldStack.spacing = 15
        
        dateLabel.topAnchor.constraint(equalTo: pickupFieldStack.topAnchor, constant: 5).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: pickupFieldStack.leadingAnchor, constant: 10).isActive = true
        
        dateField.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor, constant: 5).isActive = true
        
        timeLabel.topAnchor.constraint(equalTo: dateField.bottomAnchor, constant: 5).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: pickupFieldStack.leadingAnchor, constant: 10).isActive = true
        
        timeField.leadingAnchor.constraint(equalTo: timeLabel.leadingAnchor, constant: 5).isActive = true
        
        pickupField.addSubview(pickupFieldStack)
        pickupFieldStack.translatesAutoresizingMaskIntoConstraints = false
        pickupFieldStack.leadingAnchor.constraint(equalTo: pickupField.leadingAnchor).isActive = true
        pickupFieldStack.trailingAnchor.constraint(equalTo: pickupField.trailingAnchor).isActive = true
        pickupFieldStack.topAnchor.constraint(equalTo: pickupField.topAnchor).isActive = true
        
        pickupField.isHidden = true
        view.addSubview(pickupField)
        pickupField.translatesAutoresizingMaskIntoConstraints = false
        pickupField.topAnchor.constraint(equalTo: deliveryStack.bottomAnchor, constant: 10).isActive = true
        pickupField.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pickupField.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pickupField.bottomAnchor.constraint(equalTo: making.topAnchor, constant: -5).isActive = true
        
    }
    //MARK: ЧатерБокс
    func createCheckbox(title: String) -> UIButton {
        let checkboxButton = UIButton(type: .system)
        checkboxButton.setTitle("⬜️ " + title, for: .normal) 
        checkboxButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        checkboxButton.addTarget(self, action: #selector(toggleCheckbox(_:)), for: .touchUpInside)
        checkboxButton.contentHorizontalAlignment = .left
        return checkboxButton
    }
    
    @objc func toggleCheckbox(_ sender: UIButton) {
        
        if sender.titleLabel?.text?.contains("⬜️") == true {
            sender.setTitle("✅ " + sender.titleLabel!.text!.dropFirst(2), for: .normal) 
        } else {
            sender.setTitle("⬜️ " + sender.titleLabel!.text!.dropFirst(2), for: .normal)
        }
    }
    
   //MARK: Для Обработки даты и времени
    @objc func showDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Готово", style: .plain, target: self, action: #selector(donePressedDate))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([flexSpace, doneButton], animated: false)
        
        dateField.inputAccessoryView = toolbar
        dateField.inputView = datePicker
        dateField.becomeFirstResponder()
    }
    
    @objc func showTimePicker() {
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.addTarget(self, action: #selector(timeChanged(_:)), for: .valueChanged)
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Готово", style: .plain, target: self, action: #selector(donePressedTime))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([flexSpace, doneButton], animated: false)
        
        timeField.inputAccessoryView = toolbar
        timeField.inputView = timePicker
        timeField.becomeFirstResponder()
    }
    
    @objc func donePressedDate() {
        dateField.resignFirstResponder()
    }
    
    @objc func donePressedTime() {
        timeField.resignFirstResponder() 
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateField.text = dateFormatter.string(from: sender.date)
    }

    @objc func timeChanged(_ sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .short
        timeField.text = timeFormatter.string(from: sender.date)
    }
    

    @objc func goToShopingCart(){
        navigationController?.pushViewController(ShopingCart(), animated: true)
    }
    
    @objc func goToStore(){
        navigationController?.pushViewController(StoreViewController(), animated: true)
    }
    
    @objc func goToPay(){
        navigationController?.pushViewController(PayViewController(), animated: true)
    }
    
    @objc func showToDelivery(){
        deliveryField.isHidden = false
        pickupField.isHidden = true
    }
    
    @objc func showToPickup(){
        pickupField.isHidden = false
        deliveryField.isHidden = true
    }
}

