//
//  AnimationsView.swift
//  Animations
//
//  Created by Alexander Rubtsov on 15.07.2021.
//

import UIKit

class AnimationsView: UIView {

    var viewController: GameManagerProtocol?
    
    let character = Character()
    
    var scoreLabel: UILabel = {
       let label = UILabel(frame: CGRect(x: 40, y: 10, width: 700, height: 100))
        label.text = "Score: 0"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        return label
    }()
    
    let feedBall: UIView = {
        let ballSize = 60
        let view = UIView(frame: CGRect(x: 100, y: 100, width: ballSize, height: ballSize))
        view.backgroundColor = .systemYellow
        view.layer.cornerRadius = CGFloat(ballSize/2)
        return view
    }()
    
    // MARK: - Init
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    required init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        addSubview(character)
        addSubview(feedBall)
        
        addSubview(scoreLabel)
        
        character.animationView = self
    }
    
    override func layoutSubviews() {
        setUpConstraints()
    }

    //MARK: - Functions
    
    func positionChanged(to newPosition: CGPoint) {
        character.positionChanged(to: newPosition)
    }
    
    func characterMoved(position: CGPoint) {
        let charWidth = Float(character.frame.width)
        let charHeight = Float(character.frame.height)
        
        let feedBallWidth = Float(feedBall.frame.width)
        let feedBallHeight = Float(feedBall.frame.height)

        let characterBottomRightCorner = CGPoint(x: character.frame.minX + CGFloat(charWidth), y: character.frame.minY + CGFloat(charHeight))
        let feedBallBottomRightCorner = CGPoint(x: feedBall.frame.minX + CGFloat(feedBallWidth), y: feedBall.frame.minY + CGFloat(feedBallHeight))
        
        if isOverlap(l1: CGPoint(x: character.frame.minX, y: character.frame.minY),
                     l2: CGPoint(x: feedBall.frame.minX, y: feedBall.frame.minY),
                     r1: characterBottomRightCorner,
                     r2: feedBallBottomRightCorner) {
            putNewFeedBall()
        }
    }
    
    func updateScore(with newScore: Int) {
        scoreLabel.text = "Score: \(newScore)"
    }
    
    //MARK: - Game logic
    
    func putNewFeedBall() {
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        feedBall.frame = CGRect(x: CGFloat.random(in: 0..<screenWidth-feedBall.frame.width*2),
                                y: CGFloat.random(in: 0..<screenHeight-feedBall.frame.height*2),
                                width: feedBall.frame.width,
                                height: feedBall.frame.height)
        viewController?.ateFeedBall()
    }
    
    //MARK: - Helper functions
    
    func prepareGame() {
        character.frame = CGRect(x: frame.width/2 - character.frame.width/2,
                                 y: frame.height/2 - character.frame.height/2,
                                 width: character.frame.width,
                                 height: character.frame.height)
    }
    
    func isOverlap(l1: CGPoint, l2: CGPoint, r1: CGPoint, r2: CGPoint) -> Bool {
        
        if (l1.x >= r2.x || l2.x >= r1.x) {
            return false
        }
        
        if (r1.y <= l2.y || r2.y <= l1.y) {
            return false
        }
        
        return true
    }
    
    func setUpConstraints() {
        //scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //scoreLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        //scoreLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        
        //scoreLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //scoreLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
}
