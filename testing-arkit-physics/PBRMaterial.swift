//
//  PBRMaterial.swift
//  testing-arkit-physics
//
//  Created by Sebastian on 2017-10-22.
//  Copyright © 2017 Sebastian. All rights reserved.
//

import UIKit
import SceneKit

var materials: [String:SCNMaterial] = [:]

class PBRMaterial: NSObject {
    class func materialNamed(name: String) -> SCNMaterial {
        var mat = materials[name]
        if let mat = mat {
            return mat
        }
        
        mat = SCNMaterial()
        mat!.lightingModel = SCNMaterial.LightingModel.physicallyBased
        mat!.diffuse.contents = UIImage(named: "./Assets.xassets/Materials/\(name)/\(name)-albedo.png")
        mat!.roughness.contents = UIImage(named: "./Assets.xassets/Materials/\(name)/\(name)-roughness.png")
        mat!.metalness.contents = UIImage(named: "./Assets.xassets/Materials/\(name)/\(name)-metal.png")
        mat!.normal.contents = UIImage(named: "./Assets.xassets/Materials/\(name)/\(name)-normal.png")
        mat!.diffuse.wrapS = SCNWrapMode.repeat
        mat!.diffuse.wrapT = SCNWrapMode.repeat
        mat!.roughness.wrapS = SCNWrapMode.repeat
        mat!.roughness.wrapT = SCNWrapMode.repeat
        mat!.metalness.wrapS = SCNWrapMode.repeat
        mat!.metalness.wrapT = SCNWrapMode.repeat
        mat!.normal.wrapS = SCNWrapMode.repeat
        mat!.normal.wrapT = SCNWrapMode.repeat
        
        materials[name] = mat
        return mat!
    }
}
