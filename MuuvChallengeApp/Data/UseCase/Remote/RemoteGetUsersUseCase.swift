//
//  RemoteGetUsersUseCase.swift
//  MuuvChallengeApp
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

import Foundation

protocol GetUsersClient {
    func dispatch(
        page: Int,
        _ completion: @escaping ResultCompletionHandler<Users, DomainError>
    )
}

class RemoteGetUsersUseCase: GetUsersUseCase {
    let client: GetUsersClient

    init(client: GetUsersClient) {
        self.client = client
    }

    func execute(
        page: Int,
        completion: @escaping CompletionHandler
    ) {
        client.dispatch(page: page) { result in
            completion(result)
        }
    }
}
