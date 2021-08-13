//
//  MainView.swift
//  CoreDataOld
//
//  Created by Alan Podgornov on 13.08.2021.
//

import UIKit

final class MainView: UIView {
	private lazy var textFieldWithLabel1: TextFieldWithLabelView = {
		let textFieldWithLabel = TextFieldWithLabelView()
		return textFieldWithLabel
	}()

	private lazy var textFieldWithLabel2: TextFieldWithLabelView = {
		let textFieldWithLabel = TextFieldWithLabelView()
		return textFieldWithLabel
	}()
	
	private lazy var textFieldWithLabel3: TextFieldWithLabelView = {
		let textFieldWithLabel = TextFieldWithLabelView()
		return textFieldWithLabel
	}()
	
	private lazy var button1: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Save object", for: .normal)
		button.setTitleColor(.black, for: .normal)
		button.backgroundColor = .white
		button.layer.borderWidth = 2
		button.addTarget(self, action: #selector(onButton1Tap), for: .touchUpInside)
		button.layer.borderColor = UIColor.black.cgColor
		return button
	}()
	
	private lazy var button2: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Delete all", for: .normal)
		button.setTitleColor(.black, for: .normal)
		button.backgroundColor = .white
		button.layer.borderWidth = 2
		button.addTarget(self, action: #selector(onButton2Tap), for: .touchUpInside)
		button.layer.borderColor = UIColor.black.cgColor
		return button
	}()
	
	private lazy var button3: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("dasda", for: .normal)
		button.setTitleColor(.black, for: .normal)
		button.backgroundColor = .white
		button.layer.borderWidth = 2
		button.addTarget(self, action: #selector(onButton3Tap), for: .touchUpInside)
		button.layer.borderColor = UIColor.black.cgColor
		return button
	}()
	
	 var actionOnButtonTap1: (() -> ())?
	 var actionOnButtonTap2: (() -> ())?
	 var actionOnButtonTap3: (() -> ())?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = .brown
		addSubview(textFieldWithLabel1)
		addSubview(textFieldWithLabel2)
		addSubview(textFieldWithLabel3)
		addSubview(button1)
		addSubview(button2)
		addSubview(button3)
		updateConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc private func onButton1Tap() {
		actionOnButtonTap1?()
	}
	
	@objc private func onButton2Tap() {
		actionOnButtonTap2?()
	}
	
	@objc private func onButton3Tap() {
		actionOnButtonTap3?()
	}
	
	override func updateConstraints() {
		NSLayoutConstraint.activate([
			textFieldWithLabel1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textFieldWithLabel1.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
			textFieldWithLabel1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			textFieldWithLabel1.heightAnchor.constraint(equalToConstant: 60)
		])
		
		NSLayoutConstraint.activate([
			textFieldWithLabel2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			textFieldWithLabel2.topAnchor.constraint(equalTo: textFieldWithLabel1.bottomAnchor, constant: 20),
			textFieldWithLabel2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			textFieldWithLabel2.heightAnchor.constraint(equalToConstant: 60)
		])
		
		NSLayoutConstraint.activate([
			textFieldWithLabel3.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			textFieldWithLabel3.topAnchor.constraint(equalTo: textFieldWithLabel2.bottomAnchor, constant: 20),
			textFieldWithLabel3.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			textFieldWithLabel3.heightAnchor.constraint(equalToConstant: 60)
		])
		
		NSLayoutConstraint.activate([
			button2.centerXAnchor.constraint(equalTo: centerXAnchor),
			button2.topAnchor.constraint(equalTo: textFieldWithLabel3.bottomAnchor, constant: 20),
			button2.widthAnchor.constraint(equalToConstant: 85),
			button2.heightAnchor.constraint(equalToConstant: 40)
		])
		
		NSLayoutConstraint.activate([
			button1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			button1.topAnchor.constraint(equalTo: textFieldWithLabel3.bottomAnchor, constant: 20),
			button1.trailingAnchor.constraint(equalTo: button2.leadingAnchor, constant: -10),
			button1.heightAnchor.constraint(equalToConstant: 40)
		])
		
		
		NSLayoutConstraint.activate([
			button3.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			button3.topAnchor.constraint(equalTo: textFieldWithLabel3.bottomAnchor, constant: 20),
			button3.leadingAnchor.constraint(equalTo: button2.trailingAnchor, constant: 10),
			button3.heightAnchor.constraint(equalToConstant: 40)
		])
		
		super.updateConstraints()
	}
	
	
}
