//
//  SubscribableButton.swift
//  FourDesignPatterns
//
//  Created by Alexander Rubtsov on 08.07.2021.
//

import UIKit

protocol UnitButtonProtocol {
    func pressed()
}

class SubscribableButton: UIButton, UnitButtonProtocol {
    var delegate: SubscribableUnit?
    
    func pressed() {
        delegate?.subscribePressed()
    }
}
