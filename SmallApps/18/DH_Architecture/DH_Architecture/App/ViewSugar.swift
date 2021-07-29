//
//  ViewSugar.swift
//  DH_Architecture
//
//  Created by Leonid Serebryanyy on 19.07.2021.
//

import Foundation
import UIKit

protocol ViewSpecificController {
	associatedtype RootView: UIView
}
extension ViewSpecificController where Self: UIViewController {
	func view() -> RootView {
		return self.view as! RootView
	}
	
	var contentView: RootView {
		return self.view as! RootView
	}
}
