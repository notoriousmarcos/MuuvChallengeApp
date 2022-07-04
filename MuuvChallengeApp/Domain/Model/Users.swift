//
//  Users.swift
//  MuuvChallengeApp
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

import Foundation

struct Users: Codable, Equatable {
    let page: Int
    let perPage: Int
    let total: Int
    let totalPages: Int
    let data: [User]

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data
    }
}
