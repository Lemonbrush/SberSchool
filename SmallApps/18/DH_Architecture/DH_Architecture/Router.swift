//
//  Router.swift
//  NetworkTestApp
//
//  Created by Leonid Serebryanyy on 02.06.2021.
//

import Foundation
import UIKit

protocol RouterProtocol {
//	func showDetailedController(_ model: GetGamesDataResponse)
	func showVC(_ vc: UIViewController)
}

class Router: RouterProtocol {
	private var nc: UINavigationController
	init(nc: UINavigationController) {
		self.nc = nc
	}
	
	func showVC(_ vc: UIViewController) {
		self.nc.pushViewController(vc, animated: true)
	}

	
//	func showDetailedController(_ model: GetGamesDataResponse) {
////		let controller = ImageViewController(//...)
////		nc.pushViewController(controller, animated: true)
//	}
}
