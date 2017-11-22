//
//  Fruit.swift
//  ViperDemo
//
//  Created by Abhisek on 08/11/17.
//  Copyright © 2017 Abhisek. All rights reserved.
//

import UIKit

struct Fruit {
 
    var name: String!
    var vitamin: String!
    
    init(attributes: [String: String]) {
        self.name = attributes["name"]
        self.vitamin = attributes["vitamin"]
    }
}
