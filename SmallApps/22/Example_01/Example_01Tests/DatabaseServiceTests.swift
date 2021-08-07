//
//  DatabaseServiceTests.swift
//  Example_01
//
//  Created by Ryzhov Eugene on 04.08.2021.
//  Copyright © 2021 Aleksandr Sychev. All rights reserved.
//

import XCTest
@testable import Example_01

class DatabaseStub: DatabaseServiceProtocol {
    func getData() -> [String] {
        ["stub data"]
    }
}

class MyClass {
    var databaseService: DatabaseServiceProtocol

    init(_ db: DatabaseServiceProtocol) {
        self.databaseService = db
    }

    func data() -> [String] {
        databaseService.getData()
    }

}

class DatabaseServiceTests: XCTestCase {

    func testStubExample() {
        // arrange
        let service: DatabaseServiceProtocol = DatabaseStub()
        let serviceConsumer: MyClass = .init(service)
        // act
        let data = serviceConsumer.data()
        // assert
        XCTAssertNotNil(data)
    }
    
}
