//
//  RemoteGetUsersUseCaseTests.swift
//  MuuvChallengeApp
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

@testable import MuuvChallengeApp
import XCTest

class RemoteGetUsersUseCaseTests: XCTestCase {
    private let mockClient = MockClients()
    private lazy var sut = RemoteGetUsersUseCase(client: mockClient)

    func testRemoteGetUsersUseCase_executeWithSuccess_ShouldReturnUsers() {
        // Arrange
        mockClient.result = .success(Mocks.users)

        // Act
        sut.execute(page: 1) { result in
            if case let .success(users) = result {
                // Assert
                XCTAssertEqual(users.page, 1)
                XCTAssertEqual(users.perPage, 6)
                XCTAssertEqual(users.total, 1)
                XCTAssertEqual(users.totalPages, 1)
                XCTAssertEqual(users.data, [Mocks.user])
            } else {
                XCTFail("Should receive a valid response")
            }
        }
    }

    func testRemoteGetUsersUseCase_executeWithFailure_ShouldReturnError() {
        // Arrange
        mockClient.result = .failure(.requestError(error: .badRequest))

        // Act
        sut.execute(page: 1) { result in
            if case let .failure(error) = result,
               case let .requestError(error) = error {
                // Assert
                XCTAssertEqual(error, .badRequest)
            } else {
                XCTFail("Should receive an error response")
            }
        }
    }
}
