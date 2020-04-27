//
//  ViewController.swift
//  ARKit Tutorial
//
//  Created by Mihir Singh on 25/04/20.
//  Copyright © 2020 Hey! Let's Code. All rights reserved.
//

import UIKit
import RealityKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showModel()
        overlayCoachingView()
    }
    
    func showModel () {
        
        let anchorEntity = AnchorEntity(plane: .horizontal, minimumBounds: [0.2, 0.2])
        
        let entity = try! Entity.loadModel(named: "toy_biplane")
        entity.setParent(anchorEntity)
        
        arView.scene.addAnchor(anchorEntity)
        
    }
    
    func overlayCoachingView () {
        
        let coachingView = ARCoachingOverlayView(frame: CGRect(x: 0, y: 0, width: arView.frame.width, height: arView.frame.height))
        
        coachingView.session = arView.session
        coachingView.activatesAutomatically = true
        coachingView.goal = .horizontalPlane
        
        view.addSubview(coachingView)
        
    }
    
}
