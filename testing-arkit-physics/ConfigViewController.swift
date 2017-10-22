//
//  ConfigViewController.swift
//  testing-arkit-physics
//
//  Created by Sebastian on 2017-10-22.
//  Copyright © 2017 Sebastian. All rights reserved.
//

import UIKit

class ConfigViewController: UITableViewController {
    
    @IBOutlet weak var featurePoints: UISwitch!
    @IBOutlet weak var worldOrigin: UISwitch!
    @IBOutlet weak var physicsBodies: UISwitch!
    @IBOutlet weak var statistics: UISwitch!
    var config = Config()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set the initial values
        let config = self.config
        self.featurePoints.isOn = config.showFeaturePoints
        self.worldOrigin.isOn = config.showWorldOrigin
        self.statistics.isOn = config.showStatistics
        self.physicsBodies.isOn = config.showPhysicsBodies
    }
}
