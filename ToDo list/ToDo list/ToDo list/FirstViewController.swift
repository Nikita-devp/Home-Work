//
//  ViewController.swift
//  ToDo list
//
//  Created by Никита Гойшик on 18.02.25.
//
struct Note {
    var text: String
}

import UIKit

class FirstViewController: UIViewController {
    
    lazy var addNote = UIButton()
    
    lazy var tableview: UITableView = {
        
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Identifier")
        return table
    }()
    
    var dataSource: [Note] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Задачи"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.titleView?.backgroundColor = .darkGray
        
        view.addSubview(tableview)
        view.addSubview(addNote)
        
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        addNote.translatesAutoresizingMaskIntoConstraints = false
        addNote.setImage(UIImage(systemName: "plus"), for: .normal)
        addNote.setTitleColor(.black, for: .highlighted)
        addNote.setTitleColor(.systemBlue, for: .focused)
        addNote.backgroundColor = .systemGray5
        addNote.layer.cornerRadius = 25
        
        addNote.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        addNote.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        addNote.widthAnchor.constraint(equalToConstant: 50).isActive = true
        addNote.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addNote.addTarget(self, action: #selector(goToNextView), for: .touchUpInside)
        
         
    }
    
    @objc func goToNextView(){
        let noteDetailVC = SecondaryViewController()
        noteDetailVC.delegate = self
        navigationController?.pushViewController(noteDetailVC, animated: true)
    }
    
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource  {
    
//    // при нажатии на ячейку переходит на другой экран
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//      let destination = SecondaryViewController()
//      navigationController?.pushViewController(destination, animated: true)
//    }
    
    // количчество ячеек
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    
    // настройка ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = dataSource[indexPath.row].text
        
        return cell
    }
    
    //
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // для удаления свайпом ячеек
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataSource.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}

extension FirstViewController: SecondaryViewControllerDelegate {
    func didSave(note: Note) {
        dataSource.append(note)
        tableview.reloadData()
    }
    
}


