//
//  Cube.swift
//  testing-arkit-physics
//
//  Created by Sebastian on 2017-10-22.
//  Copyright © 2017 Sebastian. All rights reserved.
//

import UIKit
import ARKit

class Letter: SCNNode {
    init(_ position: SCNVector3, with text: String) {
        super.init()
        let text = SCNText(string: text, extrusionDepth: 1)
        
        // cube.materials = [material]
        let node = SCNNode(geometry: text)
        node.scale = SCNVector3Make(0.0075, 0.0075, 0.0075)
        
        // The physicsBody tells SceneKit this geometry should be manipulated by the physics engine
        node.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        node.physicsBody?.mass = 2.0
        node.physicsBody?.categoryBitMask = CollisionCategory.cube.rawValue
        node.position = position
        node.castsShadow = true
        
        self.addChildNode(node)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func currentMaterial() -> SCNMaterial {
        var materialName: String
        switch currentMaterialIndex {
        case 0:
            materialName = "rustediron-streaks"
        case 1:
            materialName = "carvedlimestoneground"
        case 2:
            materialName = "granitesmooth"
        case 3:
            materialName = "old-textured-fabric"
        default:
            materialName = "rustediron-streaks"
        }
        
        return PBRMaterial.materialNamed(name: materialName)
    }
    
    func changeMaterial() {
        // Static, all future cubes use this to have the same material
        currentMaterialIndex = (currentMaterialIndex + 1) % 4
        self.childNodes.first?.geometry?.materials = [Cube.currentMaterial()]
    }
}

