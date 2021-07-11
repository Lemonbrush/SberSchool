//
//  ColorsView.swift
//  MVCColors
//
//  Created by Alexander Rubtsov on 11.07.2021.
//

import UIKit

class ColorsView: UIView {
    
    var viewControllerOwner: ColorsViewController?

    let button1: UIButton = {
        let button: UIButton = createFancyButton(title: "Red", color: .systemRed)
        return button
    }()
    
    let button2: UIButton = {
        let button: UIButton = createFancyButton(title: "Green", color: .systemGreen)
        return button
    }()
    
    let button3: UIButton = {
        let button: UIButton = createFancyButton(title: "Blue", color: .systemBlue)
        return button
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 15
        
        return stackView
    }()
    
    //MARK: - Init
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    required init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        button1.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button2.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button3.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        addSubview(stackView)
        
        setUpStackViewConstraints()
        setUpButtonConstaraints(button1)
        setUpButtonConstaraints(button2)
        setUpButtonConstaraints(button3)
    }
    
    //MARK: - Functions
    
    @objc func buttonPressed(_ sender: UIButton ) {
        guard let color = sender.backgroundColor else { return }
        
        viewControllerOwner?.buttonTapped(with: color)
    }
    
    func changeBackgroundColor(with newColor: UIColor) {
        backgroundColor = newColor
    }

    //MARK: - Helper functons
    
    static func createFancyButton(title: String, color: UIColor) -> UIButton {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = color
        button.layer.cornerRadius = 25
        button.setTitle(title, for: .normal)
        
        button.layer.shadowOpacity = 0.3
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowRadius = 5
        button.layer.shadowOffset = .zero
        
        return button
    }
    
    //Constraints
    func setUpStackViewConstraints() {
        
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(button3)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func setUpButtonConstaraints(_ button: UIButton) {
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
}
