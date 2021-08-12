//
//  DefaultStorageService.swift
//  KeyChainApp
//
//  Created by Deniz Kaplan on 21.06.2021.
//

import Foundation

// NSSecureCoding - cущность
// NSCoding

final class DefaultStorageService {

	private let defaults: UserDefaults
	private let encoder = JSONEncoder()
	private let decoder = JSONDecoder()
	private let archiver = NSKeyedArchiver(requiringSecureCoding: true)

	init(userDefaults: UserDefaults) {
		self.defaults = userDefaults
	}

	convenience init() {
		self.init(userDefaults: UserDefaults.standard)
	}

	func save<T: Encodable>(object: T, for key: String) {
		guard let data = try? encoder.encode(object) else {
			return
		}
		defaults.setValue(data, forKey: key)
	}

	func object<T: Decodable>(for key: String) -> T? {
		guard let data = defaults.data(forKey: key) else {
			return nil
		}
		return try? decoder.decode(T.self, from: data)
	}
}
