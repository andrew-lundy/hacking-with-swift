//
//  TableViewController.swift
//  Project4
//
//  Created by Andrew Lundy on 8/24/19.
//  Copyright © 2019 Andrew Lundy. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let webView = ViewController()
    var websites = ["apple.com", "hackingwithswift.com", "facebook.com"]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(webView.websites)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WebsiteCell", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentSite = websites[indexPath.row]
        webView.currentSite = currentSite
       
        if webView.websites.contains(currentSite) {
            navigationController?.pushViewController(webView, animated: true)
        } else {
            let alert = UIAlertController(title: "Heads Up!", message: "This URL is blocked", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.navigationController?.popViewController(animated: true)
            }))
            present(alert, animated: true)
        }
    }
}
