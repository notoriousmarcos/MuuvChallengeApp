//
//  UsersTests.swift
//  MuuvChallengeApp
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

@testable import MuuvChallengeApp
import XCTest

class UsersTests: XCTestCase {
    func testUser_init_ShouldRetainProperties() {
        // Arrange
        let sut = User(
            id: 1,
            email: "a@a",
            firstName: "firstname",
            lastName: "lastname",
            avatarURL: "url"
        )

       // Assert
        XCTAssertEqual(sut.id, 1)
        XCTAssertEqual(sut.email, "a@a")
        XCTAssertEqual(sut.firstName, "firstname")
        XCTAssertEqual(sut.lastName, "lastname")
        XCTAssertEqual(sut.avatarURL, "url")
    }
}
