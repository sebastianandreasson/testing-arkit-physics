//
//  CollisionCategory.swift
//  testing-arkit-physics
//
//  Created by Sebastian on 2017-10-22.
//  Copyright © 2017 Sebastian. All rights reserved.
//

import Foundation

struct CollisionCategory: OptionSet {
    let rawValue: Int
    
    static let bottom = CollisionCategory(rawValue: 1 << 0)
    static let cube = CollisionCategory(rawValue: 1 << 1)
}