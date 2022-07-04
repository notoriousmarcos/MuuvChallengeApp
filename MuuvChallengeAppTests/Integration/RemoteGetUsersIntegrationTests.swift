//
//  RemoteGetUsersIntegrationTests.swift
//  MuuvChallengeApp
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

@testable import MuuvChallengeApp
import XCTest

class RemoteGetUsersIntegrationTests: XCTestCase {
    func testRemoteGetUsersUseCase_integration_shouldGetSuccess() {
        // Arrange
        let sut = RemoteGetUsersUseCase(client: RemoteGetUsersClient(client: NativeHTTPClient()))
        let expectation = expectation(description: "Wait response to get user.")

        // Act
        sut.execute(page: 1) { result in
            // Assert
            if case let .success(users) = result {
                XCTAssertEqual(users.page, 1)
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5)
    }
}
