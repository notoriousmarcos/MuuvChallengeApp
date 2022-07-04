//
//  GetUsersRequestTests.swift
//  MuuvChallengeApp
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

@testable import MuuvChallengeApp
import XCTest

class GetUsersRequestTests: XCTestCase {
    func testGetUsersRequest_init_ShouldRetainCorrectValues() {
        // Arrange
        let sut = GetUsersRequest(page: 1)

        // Assert
        XCTAssertEqual(sut.baseURL, "https://reqres.in/api/users")
        XCTAssertEqual(sut.method, .get)
        XCTAssertEqual(sut.contentType, "application/json")
        XCTAssertEqual(sut.params?["page"] as? String, "1")
        XCTAssertNil(sut.body)
        XCTAssertNil(sut.headers)
    }

    func testGetUsersRequest_asURLRequest_ShouldReturnURLRequest() {
        // Arrange
        let sut = GetUsersRequest(page: 1)

        // Act
        let urlRequest = sut.asURLRequest()

        // Assert
        XCTAssertNotNil(urlRequest)
        XCTAssertEqual(urlRequest?.url?.absoluteString, "https://reqres.in/api/users?page=1")
        XCTAssertNil(urlRequest?.httpBody)
        XCTAssertNotNil(urlRequest?.allHTTPHeaderFields)
        XCTAssertEqual(urlRequest?.allHTTPHeaderFields?["Content-Type"], "application/json")
        XCTAssertEqual(urlRequest?.allHTTPHeaderFields?["Accept"], "application/json")
    }
}
