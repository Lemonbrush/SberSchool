//
//  GestureView.swift
//  Gesture
//
//  Created by Alexander Rubtsov on 16.07.2021.
//

import UIKit

class GestureView: UIView {
    
    var viewController: ViewController?
    
    var circleView = CircleView()

    //MARK: - Lifecycle
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    required init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubview(circleView)
        
        let panGestureRecognizer = UIPanGestureRecognizer()
        panGestureRecognizer.addTarget(self, action: #selector(tap(sender:)))
        self.addGestureRecognizer(panGestureRecognizer)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleView.frame = CGRect(x: frame.width/2 - circleView.frame.width/2,
                                  y: frame.height/2 - circleView.frame.height/2,
                                  width: circleView.frame.width,
                                  height: circleView.frame.height)
    }
    
    //MARK: - Functions
    
    @objc func tap(sender: UIPanGestureRecognizer) {
        let point = sender.translation(in: self)
        
        print(point)
        circleView.makeColor(from: point)
    }

}
