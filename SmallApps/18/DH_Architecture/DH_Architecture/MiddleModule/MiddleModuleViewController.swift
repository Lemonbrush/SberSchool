//
//  MiddleModuleViewController.swift
//  DH_Architecture
//
//  Created by Leonid Serebryanyy on 19.07.2021.
//

import Foundation
import UIKit

protocol MiddleModuleView: AnyObject {
	func updateName(_ name: String)
}

class MiddleModuleViewController: UIViewController, MiddleModuleView {
	private var presenter: MiddleModulePresenter!
    
    private var label = UILabel()
	
	public convenience init(
		something: String,
		somethingElse: [String]?,
		deps: ServiceLocator,
		out: @escaping MiddleModuleOut
	) {
		self.init()
		self.presenter = MiddleModulePresenter(view: self, out: out, deps: deps, something: something)
	}
	
    func updateName(_ name: String) {
        label.text = name
	}
}
