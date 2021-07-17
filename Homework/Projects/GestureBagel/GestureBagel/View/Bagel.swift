//
//  Bagel.swift
//  GestureBagel
//
//  Created by Alexander Rubtsov on 17.07.2021.
//

import UIKit

class Bagel: UIView {
    
    let bagelSize = 200
    var holeSize: Int {
        get {
            return bagelSize/2
        }
    }
    
    var hole = CAShapeLayer()
    var blindSpot = CGRect()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.frame = CGRect(x: 0, y: 0, width: bagelSize, height: bagelSize)
        layer.cornerRadius = CGFloat(bagelSize/2)
        backgroundColor = .systemGreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    
    func makeHole() {
        hole.frame = bounds
        
        let circle = CGRect(x: bagelSize/2 - holeSize/2,
                            y: bagelSize/2 - holeSize/2,
                            width: holeSize,
                            height: holeSize)
        let circlePath = UIBezierPath(ovalIn: circle)
        let path = UIBezierPath(rect: bounds)
        path.append(circlePath)
        hole.fillRule = CAShapeLayerFillRule.evenOdd
        hole.path = path.cgPath
        layer.mask = hole
        
        blindSpot = circle
    }
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        
        if view == self && blindSpot.contains(point) {
            return nil
        } else {
            return view
        }
    }
    
    //MARK: - Helper functions
    
    func isBagel(_ view: UIView) -> Bool {
        return view == self ? true : false
    }
    
}

extension Bagel: ViewNameProtocol {
    func printDescription() {
        print("Bagel")
    }
}
