//
//  TextFieldWithLabelView.swift
//  CoreDataOld
//
//  Created by Alan Podgornov on 13.08.2021.
//

import UIKit

final class TextFieldWithLabelView: UIView {
	private lazy var label: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Введите текст"
		label.layer.borderWidth = 2
		label.layer.borderColor = UIColor.black.cgColor
		label.backgroundColor = .white
		return label
	}()
	
	private lazy var textField: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.layer.borderWidth = 2
		textField.layer.borderColor = UIColor.black.cgColor
		textField.backgroundColor = .white
		return textField
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		translatesAutoresizingMaskIntoConstraints = false
		addSubview(label)
		addSubview(textField)
		updateConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func updateConstraints() {
		NSLayoutConstraint.activate([
			label.leadingAnchor.constraint(equalTo: leadingAnchor),
			label.topAnchor.constraint(equalTo: topAnchor),
			label.trailingAnchor.constraint(equalTo: trailingAnchor),
			label.heightAnchor.constraint(equalToConstant: 20)
		])
		
		NSLayoutConstraint.activate([
			textField.leadingAnchor.constraint(equalTo: leadingAnchor),
			textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5),
			textField.trailingAnchor.constraint(equalTo: trailingAnchor),
			textField.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
		
		super.updateConstraints()
	}

}
