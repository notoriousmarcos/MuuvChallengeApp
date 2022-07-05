//
//  MuuvChallengeAppApp.swift
//  MuuvChallengeApp
//
//  Created by Marcos Vinicius Brito on 04/07/22.
//

import SwiftUI

class Main {
    static var shared = Main()

    private let httpClient = NativeHTTPClient()
    private lazy var getUsersUseCase = RemoteGetUsersUseCase(client: RemoteGetUsersClient(client: httpClient))

    func makeUsersList() -> some View {
        UserListViewFactory(remoteGetUsersUseCase: getUsersUseCase).make()
    }
}

@main
struct MuuvChallengeAppApp: App {
    let main = Main.shared

    var body: some Scene {
        WindowGroup {
            main.makeUsersList()
        }
    }
}
