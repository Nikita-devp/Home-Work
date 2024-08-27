//
//  ViewControllerNews.swift
//  HW8
//
//  Created by Злата Лашкевич on 28.07.24.
//

import UIKit

class ViewControllerNews: UIViewController {

    lazy var Status: UILabel = UILabel()
    lazy var ButtonReboot: UIButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(Status)
        view.addSubview(ButtonReboot)
        
        Status.text = "There's nothing here yet"
        Status.textColor = .blue
        Status.translatesAutoresizingMaskIntoConstraints = false
        Status.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        Status.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Status.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        ButtonReboot.setTitle("Reset",for: .normal)
        ButtonReboot.setTitleColor(.blue, for: .normal)
        ButtonReboot.setTitleColor(.black, for: .highlighted)
        ButtonReboot.translatesAutoresizingMaskIntoConstraints = false
        ButtonReboot.topAnchor.constraint(equalTo: Status.topAnchor, constant: 200).isActive = true
        ButtonReboot.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        

        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
