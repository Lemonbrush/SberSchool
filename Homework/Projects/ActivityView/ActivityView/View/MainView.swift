//
//  MainView.swift
//  ActivityView
//
//  Created by Alexander Rubtsov on 10.07.2021.
//

import UIKit

class MainView: UIView {
    
    weak var viewController: ViewController?
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Поделиться котиком", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 25
        return button
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cat")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    //MARK: - Init
    
    required init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    
    @objc func buttonPressed() {
        guard let safeImage = imageView.image else { return }
        
        viewController?.showActivityView(with: safeImage)
    }
    
    func setConstraints() {
        
        //Stack View
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 16.0

        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(button)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stackView)

        //Constraints
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        //Image
        imageView.heightAnchor.constraint(equalToConstant: 300.0).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 300.0).isActive = true
        
        //Button
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
