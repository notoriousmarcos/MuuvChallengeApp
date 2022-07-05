//
//  UserListFactoryTests.swift
//  MuuvChallengeAppTests
//
//  Created by Marcos Vinicius Brito on 05/07/22.
//

import Combine
@testable import MuuvChallengeApp
import SwiftUI
import XCTest

class ShowsViewFactoryTests: XCTestCase {
    func testUserListFactory_factory_ShouldReturnUserListView() {
        // Arrange
        let sut = UserListViewFactory(
            remoteGetUsersUseCase: RemoteGetUsersUseCase(
                client: RemoteGetUsersClient(client: NativeHTTPClient())
            )
        )
        // Act
        let view = sut.make()

        // Assert
        XCTAssertNotNil(view)
    }
}
