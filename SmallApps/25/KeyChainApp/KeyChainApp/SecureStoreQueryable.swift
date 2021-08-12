//
//  SecureStoreQueryable.swift
//  KeyChainApp
//
//  Created by Deniz Kaplan on 21.06.2021.
//

import Foundation

protocol SecureStoreQueryable {
	var key: String { get }
	var query: [String: Any] { get }
}
