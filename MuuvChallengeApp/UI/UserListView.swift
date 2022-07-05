//
//  UserListView.swift
//  MuuvChallengeApp
//
//  Created by Marcos Vinicius Brito on 05/07/22.
//

import SwiftUI

struct UserListView<ViewModel: UserListViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel

    init (viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            switch viewModel.state {
                case .idle:
                    list(of: viewModel.users)
                        .navigationBarTitle("Users", displayMode: .large)
                case .loadingFullScreen:
                    loadingView()
                        .navigationBarTitle("Users", displayMode: .large)
                case .error(let message):
                    VStack {
                        Text("Sorry, we get something wrong: \(message)")
                        Button(action: viewModel.onAppear, label: { Text("Retry") })
                    }
                    .navigationBarTitle("Users", displayMode: .large)
                case .loadingNextPage:
                    Color.clear
                        .navigationBarTitle("Users", displayMode: .large)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear(perform: {
            viewModel.onAppear()
        })
    }

    private func list(of users: [User]) -> some View {
        let showsWithIndex = Array(users.enumerated())
        return List(showsWithIndex, id: \.element.id) { index, user in
            NavigationLink(
                destination: UserDetailView(user: user),
                label: {
                    UserCell(model: user)
                        .onAppear {
                            guard index > users.count - 3 else { return }
                            viewModel.nextPage()
                        }
                }
            )
        }
    }

    private func loadingView() -> some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .primary))
            .scaleEffect(1)
            .padding()
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(
            id: 1,
            email: "johndoe@email.com",
            firstName: "John",
            lastName: "Doe",
            avatarURL: "https://reqres.in/img/faces/7-image.jpg"
        )
        let users = Users(
            page: 1,
            perPage: 6,
            total: 6,
            totalPages: 1,
            data: [user]
        )
        let viewModel = UserListViewModel { _, completion in
            completion(.success(users))
        }
        UserListView(viewModel: viewModel)
    }
}
