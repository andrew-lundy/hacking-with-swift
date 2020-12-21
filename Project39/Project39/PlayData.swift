//
//  PlayData.swift
//  Project39
//
//  Created by Andrew Lundy on 11/26/20.
//

import Foundation

class PlayData {
    var allWords = [String]()
    var wordCounts: NSCountedSet!
    var filteredWords = [String]()

    func applyUserFilter(_ input: String) {
        if let userNumber = Int(input) {
            // we got a number!
            applyFilter({ self.wordCounts.count(for: $0) >= userNumber })
        } else {
            // we got a string!
            applyFilter({ $0.range(of: input, options: .caseInsensitive) != nil })
        }
    }
    
    func applyFilter(_ filter: (String) -> Bool) {
        filteredWords = allWords.filter(filter)
    }
    
    init() {
        if let path = Bundle.main.path(forResource: "plays", ofType: "txt") {
            if let plays = try? String(contentsOfFile: path) {
                allWords = plays.components(separatedBy: CharacterSet.alphanumerics.inverted)
                allWords = allWords.filter { $0 != "" }
                
                wordCounts = NSCountedSet(array: allWords)
                let sorted = wordCounts.allObjects.sorted { wordCounts.count(for: $0) > wordCounts.count(for: $1) }
                allWords = sorted as! [String]
                
            }
        }
        
        applyUserFilter("swift")
    }
}
