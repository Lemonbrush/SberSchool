//
//  SavebleClass.swift
//  KeyChainApp
//
//  Created by Deniz Kaplan on 21.06.2021.
//

import Foundation

final class SavebleClass {
	var name = "default"
	var age = 10
}

extension SavebleClass: Codable {}

