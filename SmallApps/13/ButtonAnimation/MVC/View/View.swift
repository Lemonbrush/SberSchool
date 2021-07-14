//
//  View.swift
//  MVC
//
//  Created by Alexander Rubtsov on 09.07.2021.
//

import UIKit

class DummyView: UIView {
    
    weak var viewController: ViewController?
    lazy var timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(animateButton), userInfo: nil, repeats: true)
    
    lazy var textButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .systemGreen
        button.setTitle("press me", for: .normal)
        return button
    }()
    
    lazy var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        label.backgroundColor = .systemRed
        return label
    }()
    
    required init() {
        super.init(frame: .zero)
        
        self.addSubview(textButton)
        self.addSubview(label)
        
        textButton.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonPressed() {
        timer.fire()
        self.viewController?.buttonPressed()
    }
    
    @objc func animateButton() {
        var height = textButton.frame.height
        var width = textButton.frame.width
        
        guard height <= UIScreen.main.bounds.height  else { return }
        
        textButton.frame = CGRect(x: 100, y: 100, width: width + 10, height: height + 10)
    }
    
    func updateText(with string: String) {
        label.text = string
    }
}
