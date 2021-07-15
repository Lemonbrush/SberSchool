//
//  AnimationsView.swift
//  Animations
//
//  Created by Alexander Rubtsov on 15.07.2021.
//

import UIKit

protocol AnimationControllerDelegate {
    
}

class AnimationsView: UIView {

    var viewController: AnimationControllerDelegate?
    
    let character = Character()
    
    // MARK: - Init
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    required init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        addSubview(character)
    }

    //MARK: - Functions
    
    func positionChanged(to newPosition: CGPoint) {
        character.positionChanged(to: newPosition)
    }
    
    func prepareGame() {
        character.frame = CGRect(x: frame.width/2 - character.frame.width/2,
                                 y: frame.height/2 - character.frame.height/2,
                                 width: character.frame.width,
                                 height: character.frame.height)
    }
}
