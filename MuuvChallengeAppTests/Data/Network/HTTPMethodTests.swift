//
//  HTTPMethodTests.swift
//  MuuvChallengeApp
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

@testable import MuuvChallengeApp
import XCTest

class HTTPMethodTests: XCTestCase {
    func testHTTPMethod_initWithRawValue_ShouldReceiveCorrectHTTPMethod() {
        XCTAssertEqual(HTTPMethod(rawValue: "GET"), .get)
        XCTAssertEqual(HTTPMethod(rawValue: "POST"), .post)
        XCTAssertEqual(HTTPMethod(rawValue: "DELETE"), .delete)
        XCTAssertEqual(HTTPMethod(rawValue: "PUT"), .put)
    }
}
