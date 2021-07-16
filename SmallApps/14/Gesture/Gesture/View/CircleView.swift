//
//  CircleView.swift
//  Gesture
//
//  Created by Alexander Rubtsov on 16.07.2021.
//

import UIKit

class CircleView: UIView {
    
    var gradient: CAGradientLayer = CAGradientLayer()
    
    private let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    //MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        let circleSize = 100
        self.frame = CGRect(x: 0, y: 0, width: circleSize, height: circleSize)
        layer.insertSublayer(gradient, at:0)
        setUpGradient(colors: [UIColor.systemYellow.cgColor, UIColor.systemRed.cgColor])
        clipsToBounds = true
        layer.cornerRadius = CGFloat(circleSize/2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        print(view)
        return view
    }
    
    //MARK: - Functions
    
    func makeColor(from point: CGPoint) {
        let tipColorConstant = abs(point.x/255)
        let topColor = UIColor(red: tipColorConstant, green: tipColorConstant, blue: tipColorConstant, alpha: 1)
        
        let bottomColorConstant = abs(point.y/255)
        let bottomColor = UIColor(red: bottomColorConstant, green: bottomColorConstant, blue: bottomColorConstant, alpha: 1)
        
        setUpGradient(colors: [topColor.cgColor, bottomColor.cgColor])
    }
    
    //MARK: - Helper functions
    
    func setUpGradient(colors: [CGColor]) {
        //let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        //let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
                    
        gradient.colors = colors
        gradient.locations = [0.0, 1.0]
        gradient.frame = bounds
    }
}
