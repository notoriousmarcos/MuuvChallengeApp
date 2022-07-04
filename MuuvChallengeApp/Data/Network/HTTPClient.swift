//
//  HTTPClient.swift
//  MuuvChallengeApp
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

import Foundation

protocol HTTPClient {
    func dispatch<ReturnType: Codable>(
        request: Request,
        _ completion: @escaping ResultCompletionHandler<ReturnType, DomainError>
    )
}
