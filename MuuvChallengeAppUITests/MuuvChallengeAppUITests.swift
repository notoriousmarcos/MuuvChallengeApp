//
//  MuuvChallengeAppUITests.swift
//  MuuvChallengeAppUITests
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

import XCTest

class MuuvChallengeAppUITests: XCTestCase {
    override func setUpWithError() throws {
        super.setUpWithError()
        continueAfterFailure = false
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
