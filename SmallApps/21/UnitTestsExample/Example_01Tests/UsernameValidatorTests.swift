//
//  UsernameValidatorTests.swift
//  Example_01Tests
//
//  Created by Aleksandr Sychev on 18/11/2019.
//  Copyright © 2019 Aleksandr Sychev. All rights reserved.
//

import Foundation
import XCTest
@testable import Example_01

class UsernameValidatorTests: XCTestCase {
    
    let sut = UsernameValidator()

	func testTooShortUsername() {
		let result = sut.isValid("U1")

		XCTAssertFalse(result, "Error")
	}

	func testCorrectUsername() {
        let result = sut.isValid("SuperLongName")
        
        XCTAssertTrue(result)
	}
}
