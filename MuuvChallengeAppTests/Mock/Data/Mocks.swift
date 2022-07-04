//
//  UsersTests.swift
//  MuuvChallengeApp
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

import Foundation
@testable import MuuvChallengeApp

struct Mocks {
    static let user = User(
        id: 1,
        email: "a@a",
        firstName: "firstname",
        lastName: "lastname",
        avatarURL: "url"
    )

    static let users = Users(
        page: 1,
        perPage: 6,
        total: 1,
        totalPages: 1,
        data: [user]
    )

    static let usersData = """
        {
            \"page\": 1,
            \"per_page\": 6,
            \"total\": 1,
            \"total_pages\": 1,
            \"data\": [
                {
                    \"id\": 1,
                    \"email\": \"a@a\",
                    \"first_name\": \"firstname\",
                    \"last_name\": \"lastname\",
                    \"avatar\": \"url\"
                },
            ]
        }
    """.data(using: .utf8)
}
