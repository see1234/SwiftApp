//
//  CleanSwiftTests.swift
//  777
//
//  Created by Расим on 23.07.2023.
//

import XCTest
@testable import CleanSwift

class MyTestCase: XCTestCase {
    func testAddition() {
        let a = 5
        let b = 10
        let result = a + b
        XCTAssertEqual(result, 15, "Sum should be 15")
    }
    
    func testSubtraction() {
        let a = 10
        let b = 5
        let result = a - b
        XCTAssertEqual(result, 5, "Difference should be 5")
    }
}

final class CleanSwiftTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
