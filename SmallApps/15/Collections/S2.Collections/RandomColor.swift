//
//  RandomColor.swift
//  ScrollAndTableLab
//
//  Created by Leonid Serebryanyy on 24.05.2021.
//

import Foundation
import UIKit

extension UIColor {
	static func randomColor() -> UIColor {
		let r: (()->(CGFloat)) = { return CGFloat(Float.random(in: 1...255) / 255) }
		
		return UIColor(
			red: r(),
			green: r(),
			blue: r(),
			alpha: 1
		)
	}

}
