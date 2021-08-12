//
//  DefaultStorageServiceTests.swift
//  KeyChainAppTests
//
//  Created by Deniz Kaplan on 21.06.2021.
//

import XCTest
@testable import KeyChainApp

final class DefaultStorageServiceTests: XCTestCase {

	var sut: DefaultStorageService!
	var defaultsMock: DefaultsMock!

	override func setUpWithError() throws {
		try super.setUpWithError()

		defaultsMock = .init()
		sut = .init(userDefaults: defaultsMock)
	}

	override func tearDownWithError() throws {
		sut = nil
		defaultsMock = nil

		try super.tearDownWithError()
	}

	func testSaveData() {
		// arrange
		let obj = SavebleClass()
		obj.name = "test"

		// act
		sut.save(object: obj, for: "testKey")

		// assert
		XCTAssertTrue(defaultsMock.setValueInvoked)
		XCTAssertTrue(defaultsMock.key == "testKey")
	}

	func testReadData() {
		// arrange

		// act
		let _: SavebleClass? = sut.object(for: "testKey")

		// assert
		XCTAssertTrue(defaultsMock.valueInvoked)
		XCTAssertTrue(defaultsMock.key == "testKey")
	}
}

final class DefaultsMock: UserDefaults {

	var value: Any?
	var key: String?

	var setValueInvoked = false
	var valueInvoked = false

	override func setValue(_ value: Any?, forKey key: String) {
		self.value = value
		self.key = key
		setValueInvoked = true
	}

	override func data(forKey key: String) -> Data? {
		valueInvoked = true
		self.key = key
		return value as? Data
	}
}
