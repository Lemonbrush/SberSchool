//
//  UsernameValidatorTests.swift
//  Example_01Tests
//
//  Created by Aleksandr Sychev on 18/11/2019.
//  Copyright © 2019 Aleksandr Sychev. All rights reserved.
//

import XCTest
@testable import Example_01

class UsernameValidatorTests: XCTestCase {

	func testTooShortUsername() {
		let validator = UsernameValidator()

		let result = validator.isValid("U1")

		XCTAssertFalse(result, "Error")
	}

	func testCorrectUsername() {
        let validator = UsernameValidator()

        let result = validator.isValid("U1asdfas")

        XCTAssertTrue(result, "Error")
	}
}
