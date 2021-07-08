//
//  MementoButton.swift
//  FourDesignPatterns
//
//  Created by Alexander Rubtsov on 08.07.2021.
//

import UIKit

class MementoButton: UIButton, UnitButtonProtocol {
    var delegate: SubscribableUnit?
    
    func pressed() {
        delegate?.undoMementoStack.undo()
    }
}
