//
//  RemoteGetUsersClientTests.swift
//  MuuvChallengeAppTests
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

@testable import MuuvChallengeApp
import XCTest

class RemoteGetUsersClientTests: XCTestCase {
    private lazy var httpClient = MockHTTPClient()
    private lazy var sut = RemoteGetUsersClient(client: httpClient)

    func testRemoteGetUsersClient_dispatch_ShouldSuccessWithUsers() {
        // Assert
        httpClient.responses.append(
            [GetUsersRequest(page: 1).toString(): (Mocks.users, nil)]
        )

        // Act
        sut.dispatch(page: 1) { result in
            if case let .success(users) = result {
                XCTAssertEqual(users, Mocks.users)
            } else {
                XCTFail("Should be succeed.")
            }
        }
    }

    func testRemoteGetUsersClient_dispatch_ShouldReceiveAnHTTPError() {
        // Assert
        httpClient.responses.append(
            [GetUsersRequest(page: 1).toString(): (nil, .requestError(error: .unauthorized))]
        )

        // Act
        sut.dispatch(page: 1) { result in
            if case let .failure(error) = result,
               case let .requestError(error) = error {
                XCTAssertEqual(error, .unauthorized)
            } else {
                XCTFail("Should be Failed.")
            }
        }
    }
}
