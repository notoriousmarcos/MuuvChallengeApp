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
        page: 0,
        perPage: 6,
        total: 6,
        totalPages: 1,
        data: [user]
    )
}
