//
//  TypeAlias.swift
//  MuuvChallengeApp
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

import Foundation

typealias ResultCompletionHandler<T, E: Error> = (Result<T, E>) -> Void
