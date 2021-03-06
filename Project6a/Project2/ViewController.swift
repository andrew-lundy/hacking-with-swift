//
//  ViewController.swift
//  Project2
//
//  Created by Andrew Lundy on 8/21/19.
//  Copyright © 2019 Andrew Lundy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var questionsAnswered = 0
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String

        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Incorrect - that is the flag of \(countries[sender.tag].uppercased())"
            score -= 1
        }
        
        if questionsAnswered == 10 {
            let alert = UIAlertController(title: "End of Game!", message: "You answered \(questionsAnswered) questions and got \(score) of them correct.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "End Game and Play Again", style: .default, handler: resetGame))
            present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(alert, animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showScore))
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderWidth = 1
        button3.layer.borderColor = UIColor.lightGray.cgColor
        askQuestion()
    }
    
    
    @objc func showScore() {
        let newScore = score
        
        let alert = UIAlertController(title: "Your Score", message: "Points: \(newScore)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    func resetGame(action: UIAlertAction! = nil) {
        score = 0
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
         title = "\(countries[correctAnswer].uppercased()). Score: \(score)"
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        questionsAnswered += 1
        title = "\(countries[correctAnswer].uppercased()). Score: \(score)"
    }
    

    
    
}

