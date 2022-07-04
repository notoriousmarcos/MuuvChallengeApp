//
//  GetUsersRequest.swift
//  MuuvChallengeApp
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

import Foundation

struct GetUsersRequest: Request {
    // MARK: - Properties
    let baseURL: String = "https://reqres.in/api/users"
    let method: HTTPMethod = .get
    let contentType: String = "application/json"
    var params: [String: Any]?
    let body: [String: Any]? = nil
    let headers: [String: String]? = nil

    init(page: Int) {
        params = [
            "page": "\(page)"
        ]
    }
}
