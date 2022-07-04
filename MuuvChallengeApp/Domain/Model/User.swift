//
//  User.swift
//  MuuvChallengeApp
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

import Foundation

struct User: Model {
    // MARK: - Properties
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatarURL: String

    enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatarURL = "avatar"
    }
}
