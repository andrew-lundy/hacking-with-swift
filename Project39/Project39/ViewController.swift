//
//  ViewController.swift
//  Project39
//
//  Created by Andrew Lundy on 11/26/20.
//

import UIKit

class ViewController: UITableViewController {

    var playData = PlayData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playData.allWords.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let word = playData.allWords[indexPath.row]
        cell.textLabel!.text = word
        return cell
    }
    

}

