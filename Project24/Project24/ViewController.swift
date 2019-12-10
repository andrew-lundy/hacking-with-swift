//
//  ViewController.swift
//  Project24
//
//  Created by Andrew Lundy on 12/9/19.
//  Copyright © 2019 Andrew Lundy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var languages = ["Python", "JavaScript", "Swift"]
    var password = "123456"
    var prefix = "123"
    
    let string = "This is a test string"
    let attributes: [NSAttributedString.Key: Any] = [
        .underlineStyle: NSUnderlineStyle.thick,
        .foregroundColor: UIColor.white,
        .backgroundColor: UIColor.red,
        .font: UIFont.boldSystemFont(ofSize: 36)
    ]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if languages.contains(where: { $0 == "Swift" } ) {
            print("YES")
        }
        
        let attributedString = NSAttributedString(string: string, attributes: attributes)
        
        
        print(password.withPrefix("car"))
        
    }
}


extension String {
    // remove a prefix if it exists
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }

    // remove a suffix if it exists
    func deletingSuffix(_ suffix: String) -> String {
        guard self.hasSuffix(suffix) else { return self }
        return String(self.dropLast(suffix.count))
    }
    
    // Challenge 1
    func withPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return String(prefix + self) }
        return self
    }
}

