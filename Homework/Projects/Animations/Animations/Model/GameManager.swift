//
//  GameLogic.swift
//  Animations
//
//  Created by Alexander Rubtsov on 20.07.2021.
//

import Foundation

protocol GameManagerProtocol {
    func ateFeedBall()
    func updateScore(with newScore: Int)
}

struct GameManager {
    var delegate: GameManagerProtocol?
    
    var score = 0
    var feedBallValue = 1
    
    mutating func increaseScore() {
        score += feedBallValue
        delegate?.updateScore(with: score)
    }
}
