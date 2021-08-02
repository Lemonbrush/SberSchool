//
//  UsernameValidatorTests.swift
//  Example_01Tests
//
//  Created by Aleksandr Sychev on 18/11/2019.
//  Copyright © 2019 Aleksandr Sychev. All rights reserved.
//
import XCTest

class UsernameValidatorTests: XCTestCase {
    
    let sut = MocUsernameValidator()

    func testTooShortUsername() {
        let result = sut.isValid("U1")

        XCTAssertFalse(result, "Error")
    }

    func testCorrectUsername() {
        let result = sut.isValid("SuperLongName")
        
        XCTAssertTrue(result)
    }
}

