//
//  RemoteGetUsersClient.swift
//  MuuvChallengeApp
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

import Foundation

struct RemoteGetUsersClient: GetUsersClient {
    // MARK: - Properties
    private let client: HTTPClient

    // MARK: - init
    init(client: HTTPClient) {
        self.client = client
    }

    func dispatch(
        page: Int,
        _ completion: @escaping ResultCompletionHandler<Users, DomainError>
    ) {
        client.dispatch(
            request: GetUsersRequest(page: page)
        ) { result in
            completion(result)
        }
    }
}
