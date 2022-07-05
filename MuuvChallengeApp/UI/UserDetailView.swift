//
//  UserDetailView.swift
//  MuuvChallengeApp
//
//  Created by Marcos Vinicius Brito on 05/07/22.
//

import Combine
import SwiftUI

struct UserDetailView: View {
    var user: User

    var body: some View {
        NavigationView {
            mainView(of: user)
        }
        .navigationBarTitle("\(user.firstName) \(user.lastName)", displayMode: .inline)
    }

    private func mainView(of user: User) -> some View {
        VStack {
            if let avatarImageURL = URL(string: user.avatarURL) {
                AsyncImage(
                    url: avatarImageURL,
                    placeholder: { Text("Loading...") },
                    image: { Image(uiImage: $0) }
                )
                .scaledToFit()
                .frame(idealHeight: 300, alignment: .center)
            }
            HStack {
                Text("\(user.lastName), ")
                    .font(.title)
                Text("\(user.firstName)")
                    .font(.title2)
            }

            Divider().background(Color.white)
            Text(user.email)
                .font(.headline)
                .multilineTextAlignment(.center)
        }.padding()
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(
            id: 1,
            email: "johndoe@email.com",
            firstName: "John",
            lastName: "Doe",
            avatarURL: "https://reqres.in/img/faces/7-image.jpg"
        )
        UserDetailView(user: user)
    }
}
