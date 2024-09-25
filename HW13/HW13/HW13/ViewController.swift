//
//  ViewController.swift
//  HW13
//
//  Created by Злата Лашкевич on 25.09.24.
//

import UIKit

final class ViewController: UIViewController {
    private let array = Array(0...10)
    private let Programm = ["C+", "Swift", "json", "ObjektiveC", "Java"]
    private let TableView = UITableView()
    private let Key = "CELL"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupTable()
    }
    
    func SetupTable() {
        view.addSubview(TableView)
        TableView.translatesAutoresizingMaskIntoConstraints = false
        TableView.register(UITableViewCell.self, forCellReuseIdentifier: Key)
        TableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        TableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        TableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        TableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        TableView.delegate = self
        TableView.dataSource = self
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.TableView.dequeueReusableCell(withIdentifier: Key, for: indexPath)
        var Program = cell.defaultContentConfiguration()
        if indexPath.row < array.count {
        }
        else {
            let index = indexPath.row - array.count
            Program.text = Programm[index]
        }
        cell.contentConfiguration = Program
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Programm.count + array.count 
    }
    
}

