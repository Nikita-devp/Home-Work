//
//  SCeneVIew.swift
//  HW12
//
//  Created by Злата Лашкевич on 25.09.24.
//

import SceneKit

class ViewController: NSViewController {
    
    lazy var sceneView: SCNView = {
        let sceneView = SCNView(frame: .zero)
        sceneView.allowsCameraControl = true
        sceneView.scene = SCNScene(named: "art.scnassets/ship.scn")!
        return sceneView
    }()
           
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(sceneView)      // put it first
        self.viewAnchors(sceneView)          // put it next
        
        self.view.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
