//
//  ViewController.swift
//  Project7
//
//  Created by Andrew Lundy on 8/31/19.
//  Copyright © 2019 Andrew Lundy. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var petitions = [Petition]()
    var filteredPetitions = [Petition]()
    var searchActive: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let urlString: String
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showCredits))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(filterPetitions))
        title = "Whitehouse Petitions"
        
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            }
        }
        showError()
    }
    
    @objc func filterPetitions() {
        let ac = UIAlertController(title: "Search for Petitions", message: "Enter a string to filter the petitions", preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Filter Petitions", style: .default, handler: { [weak self] (action) in
            let filteredSearch = ac.textFields?[0].text as! String
            // Project 9 Challenge 3 - 9/12/2019
            DispatchQueue.global(qos: .userInitiated).async {
                self?.filteredPetitions = self?.petitions.filter { $0.title.contains(filteredSearch) } ?? [Petition]()
            }
        
            self?.searchActive = true
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
        }))
        
        ac.addAction(UIAlertAction(title: "Clear Filter", style: .cancel, handler: { (action) in
            self.searchActive = false
            self.tableView.reloadData()
           
        }))
        present(ac, animated: true)
    }

    @objc func filterSearch() {
        
    }
    
    @objc func showCredits() {
        let ac = UIAlertController(title: "API Info", message: "This API is provided by the 'We the People API of the Whitehouse'", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive == true {
            return filteredPetitions.count
        } else {
            return petitions.count
        }
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition: Petition
        
        if searchActive == true {
             petition = filteredPetitions[indexPath.row]
        } else {
            petition = petitions[indexPath.row]
        }
        
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = String(petition.body)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

