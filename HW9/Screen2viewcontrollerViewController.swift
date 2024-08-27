//
//  Screen2viewcontrollerViewController.swift
//  HW8
//
//  
//

import UIKit



class Screen2viewcontrollerViewController: UIViewController {
    
    lazy var vieeew: UIView = .init()
    
    lazy var botom: UIButton = UIButton()
    
    lazy var bottom1: UIButton = UIButton()
    
    lazy var bottom2: UIButton = UIButton()
    
    lazy var bottom3: UIButton = UIButton()
    
    lazy var view1: UIView = UIView()
    
    lazy var view2: UIView = UIView()
    
    lazy var view3: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(botom)
        vieeew.backgroundColor = .red
        view.addSubview(vieeew)
        view.addSubview(bottom1)
        view.addSubview(bottom2)
        view.addSubview(bottom3)
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(view3)
        
        vieeew.frame = .init(x: 45, y: 45, width: 100, height: 100)
        
        botom.setTitle("Log in", for: .normal)
        
        botom.setTitleColor(.black, for: .normal)
        botom.frame = .init(x: 175, y: 200, width: 70, height: 70)
        botom.addTarget(self, action: #selector(openloginscreen), for: .touchUpInside)
        botom.backgroundColor = .blue
        botom.setTitleColor(.green, for: .highlighted)
        
        
        bottom1.frame = .init(x: 315, y: 450, width: 100, height: 100)
        bottom2.frame = .init(x: 215, y: 616, width: 100, height: 100)
        bottom3.frame = .init(x: 10, y: 304, width: 100, height: 100)
        
        bottom1.setTitle("Seting", for: .normal)
        bottom1.setTitleColor(.black, for: .normal)
        bottom1.backgroundColor = .gray
        
        
        bottom2.setTitle("Contact", for: .normal)
        bottom2.setTitleColor(.black, for: .normal)
        bottom2.backgroundColor = .green
        
        bottom3.setTitle(".....", for: .normal)
        bottom3.setTitleColor(.black, for: .normal)
        bottom3.backgroundColor = .cyan
        
        view1.frame = .init(x: 40, y: 470, width: 40, height: 40)
        view2.frame = .init(x: 150, y: 300, width: 20, height: 20)
        view3.frame = .init(x: 170, y: 450, width: 70, height: 70)
        
        view1.backgroundColor = .brown
        view2.backgroundColor = .orange
        view3.backgroundColor = .purple
        
        
            }
    
    @objc func openloginscreen() {
        let loginscreen = manualViewController()
        navigationController?.pushViewController(loginscreen, animated: true)
        
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
