//
//  Person.swift
//  Project10
//
//  Created by Andrew Lundy on 9/21/19.
//  Copyright © 2019 Andrew Lundy. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
