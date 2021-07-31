//
//  Sugar.swift
//  PHPickerDemo
//
//  Created by Leonid Serebryanyy on 30.07.2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
	static var randomColor: UIColor {
		let r: (()->(CGFloat)) = { return CGFloat(Float.random(in: 1...255) / 255) }
		return UIColor(
			red: r(),
			green: r(),
			blue: r(),
			alpha: 1
		)
	}
}
