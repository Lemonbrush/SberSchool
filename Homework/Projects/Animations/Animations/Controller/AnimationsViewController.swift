//
//  ViewController.swift
//  Animations
//
//  Created by Alexander Rubtsov on 15.07.2021.
//

import UIKit

class AnimationsViewController: UIViewController {
    
    var mainView = AnimationsView()
    var gameManager = GameManager()

    //MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        view = mainView
        mainView.viewController = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameManager.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        mainView.prepareGame()
    }
    
    //MARK: - Helper functions 

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: mainView)
        let touchPosition = CGPoint(x: touchLocation.x, y: touchLocation.y)
        mainView.positionChanged(to: touchPosition)
    }


}

extension AnimationsViewController: GameManagerProtocol {
    func updateScore(with newScore: Int) {
        mainView.updateScore(with: newScore)
    }
    
    func ateFeedBall() {
        gameManager.increaseScore()
    }
}

