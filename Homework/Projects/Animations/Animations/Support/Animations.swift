//
//  Animations.swift
//  Animations
//
//  Created by Alexander Rubtsov on 21.07.2021.
//

import UIKit

class Animations {
    
    static func getSquishSquoshAnimation() -> CAAnimationGroup {
        
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
        
        return animations
    }
}
