//
//  HTTPRandomuserAccessTests.swift
//  Created by Kiro Shin <mulgom@gmail.com> on 2024.
//

import XCTest

final class HTTPRandomuserAccessTests: XCTestCase {
    let access = HTTPRandomuserAccess()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let expectation = XCTestExpectation(description: "Tests")
        Task {
            do {
                let raw = try await access.getAllUser(10, retry: 0)
                print("* 데이터: \(raw)")
                XCTAssertTrue(raw.count > 0)
                expectation.fulfill()
            }
        }

        wait(for: [expectation], timeout: 5.0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
