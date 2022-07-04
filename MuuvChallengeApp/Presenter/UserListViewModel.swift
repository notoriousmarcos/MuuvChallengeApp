//
//  UserListViewModel.swift
//  MuuvChallengeApp
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

import Combine
import Foundation

enum UserListViewModelState: Equatable {
    case loadingFullScreen
    case loadingNextPage
    case idle
    case error(message: String)
}

protocol UserListViewModelProtocol: ObservableObject {
    typealias FetchAction = (Int, @escaping (Result<Users, DomainError>) -> Void) -> Void

    var users: [User] { get }
    var page: Int { get }
    var totalPages: Int? { get }
    var state: UserListViewModelState { get }

    func onAppear()
    func nextPage()
}

class UserListViewModel: UserListViewModelProtocol {
    // MARK: - Properties
    let fetchUsersAction: FetchAction
    @Published var users: [User] = []
    @Published var page: Int = 1
    @Published var totalPages: Int?
    @Published var state: UserListViewModelState = .idle

    // MARK: - init
    init(fetchUsersAction: @escaping FetchAction) {
        self.fetchUsersAction = fetchUsersAction
    }

    // MARK: - UserListViewModelProtocol functions
    func onAppear() {
        state = .loadingFullScreen
        fetchNextPage()
    }

    func nextPage() {
        guard page != totalPages else {
            return
        }
        state = .loadingNextPage
        fetchNextPage(page + 1)
    }

    // MARK: - Private functions
    private func fetchNextPage(_ page: Int = 1) {
        fetchUsersAction(page) { [weak self] result in
            switch result {
                case .success(let users):
                    self?.state = .idle
                    self?.page = users.page
                    self?.totalPages = users.totalPages
                    self?.users += users.data
                case .failure(let error):
                    self?.state = .error(message: error.localizedDescription)
            }
        }
    }
}
