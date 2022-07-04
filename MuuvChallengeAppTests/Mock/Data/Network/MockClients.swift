//
//  MockClients.swift
//  MuuvChallengeApp
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

import Foundation
@testable import MuuvChallengeApp
import XCTest

class MockClients {
    let url = URL(string: "https://google.com")!
    var result: Result<Codable, DomainError>?

    private func handleResult<T: Codable>(_ completion: ResultCompletionHandler<T, DomainError>) {
        if case let .success(value) = result,
           let value = value as? T {
            completion(.success(value))
        } else if case let .failure(error) = result {
            completion(.failure(error))
        } else {
            XCTFail("Result is nil or have an incorrect type.")
        }
    }
}

extension MockClients: GetUsersClient {
    func dispatch(
        page: Int,
        _ completion: @escaping ResultCompletionHandler<Users, DomainError>
    ) {
        handleResult(completion)
    }
}
