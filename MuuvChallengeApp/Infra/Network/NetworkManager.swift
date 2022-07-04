//
//  NetworkManager.swift
//  MuuvChallengeApp
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

import Foundation

protocol NetworkManager {
    func dispatch<T: Codable>(request: Request, _ completion: @escaping ResultCompletionHandler<T, DomainError>)
}
