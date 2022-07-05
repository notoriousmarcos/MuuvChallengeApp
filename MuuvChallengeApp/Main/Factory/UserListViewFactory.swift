//
//  UserListViewFactory.swift
//  MuuvChallengeApp
//
//  Created by Marcos Vinicius Brito on 05/07/22.
//

import Foundation
import SwiftUI

protocol UserListViewFactoryProtocol {
    associatedtype UserListViewModel: UserListViewModelProtocol
    func make() -> UserListView<UserListViewModel>
}

struct UserListViewFactory: UserListViewFactoryProtocol {
    let remoteGetUsersUseCase: RemoteGetUsersUseCase

    init(remoteGetUsersUseCase: RemoteGetUsersUseCase) {
        self.remoteGetUsersUseCase = remoteGetUsersUseCase
    }

    func make() -> UserListView<UserListViewModel> {
        let viewModel = UserListViewModel(
            fetchUsersAction: remoteGetUsersUseCase.execute(page:completion:)
        )
        return UserListView(viewModel: viewModel)
    }
}
