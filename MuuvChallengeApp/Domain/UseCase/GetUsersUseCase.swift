//
//  GetUsersUseCase.swift
//  MuuvChallengeApp
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

import Foundation

protocol GetUsersUseCase {
    typealias CompletionHandler = ResultCompletionHandler<Users, DomainError>
    func execute(page: Int, completion: @escaping CompletionHandler)
}
