//
//  DomainError.swift
//  MuuvChallengeApp
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

import Foundation

enum DomainError: Error {
    case unknown(error: Error?)
    case requestError(error: HTTPError)
    case errorOnParsing(error: Error)
    case guardError(error: Error)
}
