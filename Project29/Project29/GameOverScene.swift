//
//  GameOverScene.swift
//  Project29
//
//  Created by Andrew Lundy on 10/1/20.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
    
    var gameOverLabel: UILabel!
    
    override func didMove(to view: SKView) {
//        backgroundColor = UIColor(hue: 0.669, saturation: 0.99, brightness: 0.67, alpha: 1)
     
        gameOverLabel = UILabel()
        gameOverLabel.translatesAutoresizingMaskIntoConstraints = false
        gameOverLabel.text = "Game Over"
        gameOverLabel.textColor = .white
        view.addSubview(gameOverLabel)
        
        NSLayoutConstraint.activate([
            gameOverLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameOverLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
}
