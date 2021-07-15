//
//  Character.swift
//  Animations
//
//  Created by Alexander Rubtsov on 15.07.2021.
//

import UIKit

class Character: UIView {
    
    var finalDestination: CGPoint = CGPoint(x: 0, y: 0)
    var velocity: CGFloat = 5
    
    var timer: Timer?

    //MARK: - Init
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    required init() {
        super.init(frame: .zero)
        
        let viewSize = 100
        
        frame = CGRect(x: 0, y: 0, width: viewSize, height: viewSize)
        backgroundColor = .systemGreen
        layer.cornerRadius = CGFloat(viewSize/2)
    }
    
    //MARK: - Functions
    
    func positionChanged(to newPosition: CGPoint) {

        applyMoveAnimation()
        
        timer = Timer.scheduledTimer(timeInterval: 0.01,
                                     target: self,
                                     selector: #selector(changePosition),
                                     userInfo: nil,
                                     repeats: true)
        
        finalDestination = CGPoint(x: newPosition.x - frame.width/2,
                                 y: newPosition.y - frame.height/2)
        timer?.fire()
    }
    
    @objc func changePosition() {
        
        let currentX = frame.minX
        let currentY = frame.minY
        let currentSize = frame.width
        
        frame = CGRect(x: finalDestination.x > currentX ? sum(currentX, velocity, max: finalDestination.x) : subtract(currentX, velocity, min: finalDestination.x),
                                 y: finalDestination.y > currentY ? sum(currentY, velocity, max: finalDestination.y) : subtract(currentY, velocity, min: finalDestination.y),
                                 width: currentSize,
                                 height: currentSize)
        
        let currentPosition = CGPoint(x: currentX, y: currentY)

        if currentPosition == finalDestination {
            timer?.invalidate()
            layer.removeAllAnimations()
        }
    }
    
    //MARK: - Helper functions
    
    func applyMoveAnimation() {
        let squishAmount = 0.8
        
        let squash = CABasicAnimation(keyPath: "transform")
        squash.valueFunction = CAValueFunction(name: .scale)
        squash.fromValue = [1, 1, 1]
        squash.toValue = [1.2, squishAmount, 1.2]
        
        let sqush = CABasicAnimation(keyPath: "transform")
        sqush.valueFunction = CAValueFunction(name: .scale)
        sqush.fromValue = [1.2, squishAmount, 1.2]
        sqush.toValue = [squishAmount, 1.2, squishAmount]
        
        let squish = CABasicAnimation(keyPath: "transform")
        squish.valueFunction = CAValueFunction(name: .scale)
        squish.fromValue = [squishAmount, 1.2, squishAmount]
        squish.toValue = [1, 1, 1]
        
        let animations = CAAnimationGroup()
        animations.duration = 0.5
        animations.repeatCount = .greatestFiniteMagnitude
        animations.timingFunction = CAMediaTimingFunction(name: .linear)
        animations.animations = [squash, sqush, squish]
        animations.autoreverses = true
        
        layer.add(animations, forKey: nil)
    }
    
    func sum(_ a: CGFloat, _ b: CGFloat, max: CGFloat) -> CGFloat {
        let result = a + b
        return result < max ? result : max
    }
    
    func subtract(_ a: CGFloat, _ b: CGFloat, min: CGFloat) -> CGFloat {
        let result = a - b
        return result > min ? result : min
    }

}
