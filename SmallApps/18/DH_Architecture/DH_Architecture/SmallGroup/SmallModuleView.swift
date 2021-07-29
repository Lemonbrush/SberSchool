//
//  SmallModuleView.swift
//  DH_Architecture
//
//  Created by Leonid Serebryanyy on 19.07.2021.
//

import UIKit

class SmallModuleView: UIView {
    
    func viewDidAppear() {
        
    }
	
	private lazy var mainLabel: UILabel = {
		let v = UILabel()
		v.translatesAutoresizingMaskIntoConstraints = false
		return v
	}()
	
	func makeUI() {
		addSubview(mainLabel)
		
		setupLayout()
	}
	
	func setupLayout() {
		NSLayoutConstraint.activate([
			mainLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
			mainLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
		])
	}
}
