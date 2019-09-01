//
//  Petition.swift
//  Project7
//
//  Created by Andrew Lundy on 8/31/19.
//  Copyright © 2019 Andrew Lundy. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
