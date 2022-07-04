//
//  UserListViewModelTests.swift
//  MuuvChallengeAppTests
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

import Combine
@testable import MuuvChallengeApp
import XCTest

class UserListViewModelTests: XCTestCase {
    private var subscriptions = Set<AnyCancellable>()
    private var stateHistory: [UserListViewModelState] = []

    func testUserListViewModelTests_onAppear_shouldFetchUsers() {
        // Arrange
        var fetchCount = 0
        let sut = UserListViewModel { page, completion in
            fetchCount += 1
            XCTAssertEqual(page, 1)
            completion(.success(Mocks.users))
        }

        let expectationOnAppear = expectation(description: "Wait until finish onApper")

        // Act
        subscriptions.insert(sut.$state.sink { state in
            print(state)
            self.stateHistory.append(state)
            if self.stateHistory[safeIndex: 2] == .idle, self.stateHistory.count < 4 {
                expectationOnAppear.fulfill()
            }
        })

        sut.onAppear()

        // Assert
        wait(for: [expectationOnAppear], timeout: 1)
        XCTAssertEqual(stateHistory, [.idle, .loadingFullScreen, .idle])
        XCTAssertEqual(fetchCount, 1)

        _ = sut.$users.sink { users in
            XCTAssertEqual(users, Mocks.users.data)
        }

        _ = sut.$page.sink { page in
            XCTAssertEqual(page, 1)
        }

        _ = sut.$totalPages.sink { totalPages in
            XCTAssertEqual(totalPages, 1)
        }
    }

    func testUserListViewModelTests_nextPage_shouldNotFetchMoreUsers() {
        // Arrange
        var fetchCount = 0
        let sut = UserListViewModel { _, completion in
            fetchCount += 1
            completion(.success(Mocks.users))
        }

        let expectationOnAppear = expectation(description: "Wait until finish onApper")

        // Act
        subscriptions.insert(sut.$state.sink { state in
            print(state)
            self.stateHistory.append(state)
            if self.stateHistory[safeIndex: 2] == .idle, self.stateHistory.count < 4 {
                expectationOnAppear.fulfill()
            }
        })

        sut.onAppear()

        // Assert
        wait(for: [expectationOnAppear], timeout: 1)
        XCTAssertEqual(stateHistory, [.idle, .loadingFullScreen, .idle])
        XCTAssertEqual(fetchCount, 1)

        // act
        sut.nextPage()

        _ = sut.$users.sink { users in
            XCTAssertEqual(users, Mocks.users.data)
        }

        _ = sut.$page.sink { page in
            XCTAssertEqual(page, 1)
        }

        _ = sut.$totalPages.sink { totalPages in
            XCTAssertEqual(totalPages, 1)
        }

        XCTAssertEqual(stateHistory, [.idle, .loadingFullScreen, .idle])
        XCTAssertEqual(fetchCount, 1)
    }

    func testUserListViewModelTests_nextPage_shouldFetchMoreUsers() {
        // Arrange
        var fetchCount = 0
        let sut = UserListViewModel { page, completion in
            fetchCount += 1
            let users = Users(
                page: page,
                perPage: 6,
                total: 12,
                totalPages: 2,
                data: Mocks.users.data
            )
            completion(.success(users))
        }

        let expectationOnAppear = expectation(description: "Wait until finish onApper")
        let expectationNextPage = expectation(description: "Wait until finish nextPage")

        // Act
        subscriptions.insert(sut.$state.sink { state in
            print(state)
            self.stateHistory.append(state)
            if self.stateHistory[safeIndex: 4] == .idle {
                expectationNextPage.fulfill()
            } else if self.stateHistory[safeIndex: 2] == .idle, self.stateHistory.count < 4 {
                expectationOnAppear.fulfill()
            }
        })

        sut.onAppear()

        // Assert
        wait(for: [expectationOnAppear], timeout: 1)
        XCTAssertEqual(stateHistory, [.idle, .loadingFullScreen, .idle])
        XCTAssertEqual(fetchCount, 1)

        // act
        sut.nextPage()

        // Assert
        wait(for: [expectationNextPage], timeout: 1)

        _ = sut.$users.sink { users in
            XCTAssertEqual(users, Mocks.users.data + Mocks.users.data)
        }

        _ = sut.$page.sink { page in
            XCTAssertEqual(page, 2)
        }

        _ = sut.$totalPages.sink { totalPages in
            XCTAssertEqual(totalPages, 2)
        }

        XCTAssertEqual(stateHistory, [.idle, .loadingFullScreen, .idle, .loadingNextPage, .idle])
        XCTAssertEqual(fetchCount, 2)
    }

    func testUserListViewModelTests_onAppear_shouldReceiveAnError() {
        // Arrange
        var fetchCount = 0
        let sut = UserListViewModel { _, completion in
            fetchCount += 1
            completion(.failure(.requestError(error: .serverError)))
        }

        // Act
        sut.onAppear()

        _ = sut.$users.sink { users in
            XCTAssertEqual(users, [])
        }

        _ = sut.$page.sink { page in
            XCTAssertEqual(page, 1)
        }

        _ = sut.$totalPages.sink { totalPages in
            XCTAssertNil(totalPages)
        }

        _ = sut.$state.sink { state in
            XCTAssertEqual(state, .error(message: DomainError.requestError(error: .serverError).localizedDescription))
        }

        // Assert
        XCTAssertEqual(fetchCount, 1)
    }
}
