//
//  View.swift
//  GestureBagel
//
//  Created by Alexander Rubtsov on 17.07.2021.
//

import UIKit

protocol ViewNameProtocol {
    func printDescription()
}

class View: UIView {
    
    var viewController: ViewController?
    
    var bagel = Bagel()
    var redBar = RedBar()
    
    //MARK: - Init
    
    required init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        addSubview(redBar)
        addSubview(bagel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        bagel.frame = CGRect(x: frame.width/2 - bagel.frame.width/2,
                             y: frame.height/2 - bagel.frame.height/2,
                             width: bagel.frame.width,
                             height: bagel.frame.height)
        bagel.makeHole()
        
        redBar.frame = CGRect(x: frame.width/2 - redBar.frame.width/2,
                              y: frame.height/2 - redBar.frame.height/2,
                              width: redBar.frame.width,
                              height: redBar.frame.height)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        
        if let descriptionView = view as? ViewNameProtocol {
            descriptionView.printDescription()
        }
        
        return view
    }
    
}

extension View: ViewNameProtocol {
    func printDescription() {
        print("Background")
    }
}
