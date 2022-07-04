//
//  UserList.swift
//  WhiteLabelECommerce
//
//  Created by Marcos Vinicius Brito on 17/02/22.
//

import Foundation

struct UserList: Codable, Equatable {
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
