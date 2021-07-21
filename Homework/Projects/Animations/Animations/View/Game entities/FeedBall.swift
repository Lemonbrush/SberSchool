//
//  FeedBall.swift
//  Animations
//
//  Created by Alexander Rubtsov on 21.07.2021.
//

import UIKit

class FeedBall: UIView {
    
    //MARK: - Init
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    required init() {
        super.init(frame: .zero)
        
        let ballSize = 60
        frame = CGRect(x: 0, y: 0, width: ballSize, height: ballSize)
        backgroundColor = .systemYellow
        layer.cornerRadius = CGFloat(ballSize/2)
        
        applyAnimation()
    }
    
    //MARK: - Functions
    
    func applyAnimation() {
        layer.add(Animations.getSquishSquoshAnimation(), forKey: nil)
    }
    
}
