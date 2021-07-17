//
//  RedBar.swift
//  GestureBagel
//
//  Created by Alexander Rubtsov on 17.07.2021.
//

import UIKit

class RedBar: UIView {
    
    //MARK: - Init
    
    required init() {
        super.init(frame: .zero)
        
        frame =  CGRect(x: 0, y: 0, width: 50, height: UIScreen.main.bounds.height - 100)
        backgroundColor = .systemRed
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RedBar: ViewNameProtocol {
    func printDescription() {
        print("Red bar")
    }
}
