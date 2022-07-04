//
//  URLRequestExtension.swift
//  MuuvChallengeAppTests
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

import Foundation

extension URLRequest {
    var identifier: String {
        self.description
    }
}
