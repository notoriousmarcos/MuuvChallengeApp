//
//  MuuvChallengeAppUITestsLaunchTests.swift
//  MuuvChallengeAppUITests
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

import XCTest

class MuuvChallengeAppUITestsLaunchTests: XCTestCase {
    // swiftlint:disable:next empty_xctest_method
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        super.setUpWithError()
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
