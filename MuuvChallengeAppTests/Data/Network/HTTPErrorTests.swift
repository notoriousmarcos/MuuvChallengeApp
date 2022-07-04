//
//  HTTPErrorTests.swift
//  MuuvChallengeApp
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

@testable import MuuvChallengeApp
import XCTest

class HTTPErrorTests: XCTestCase {
    func testHTTPError_initWithRawValue_ShouldReceiveCorrectError() {
        XCTAssertEqual(HTTPError(rawValue: 400), .badRequest)
        XCTAssertEqual(HTTPError(rawValue: 401), .unauthorized)
        XCTAssertEqual(HTTPError(rawValue: 403), .forbidden)
        XCTAssertEqual(HTTPError(rawValue: 404), .notFound)
        XCTAssertEqual(HTTPError(rawValue: 408), .timeOut)
        XCTAssertEqual(HTTPError(rawValue: 500), .serverError)
        XCTAssertEqual(HTTPError(rawValue: -1), .unknown)
        XCTAssertEqual(HTTPError(rawValue: 1000), .unknown)
    }
}