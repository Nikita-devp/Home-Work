//
//  ViewController.swift
//  ScreenAPP
//
//  Created by Гойшик Никита on 15.08.24.
//

import UIKit

class ViewController2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let label = "KOFJIEF"
        let navigationController = UINavigationController(rootViewController: ViewControllerss(labels: label))
        present(navigationController, animated: true)
    }
    
    
class ViewControllerss: UIViewController {
        
        let labels: String
        
        init(labels: String) {
            self.labels = labels
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
class ViewController: UIViewController {
            
            lazy var labelstring = UIButton(primaryAction:.init(handler: { _ in
                guard let navigationController = self.navigationController else {return}
                if navigationController.viewControllers.count <= 5 {
                    self.navigationController?.pushViewController(ViewControllerss(labels: self.labels), animated: true)
                }}))
            
            let labels: String
            
            init(labels: String) {
                self.labels = labels
                super.init(nibName: nil, bundle: nil)
            }
            
            required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
            
            override func viewDidLoad() {
                super.viewDidLoad()
                labelstring.setTitle(labels, for: .normal)
                view.addSubview(labelstring)
                
                labelstring.frame = .init(x: 50, y: -50, width: 100, height: 100)
                
                
            }
        }
    }
}
