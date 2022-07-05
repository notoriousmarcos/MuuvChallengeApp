//
//  UserCell.swift
//  MuuvChallengeApp
//
//  Created by Marcos Vinicius Brito on 05/07/22.
//

import SwiftUI

struct UserCell: View {
    var model: User

    var body: some View {
        HStack(spacing: 8) {
            if let showImageURL = URL(string: model.avatarURL) {
                AsyncImage(
                    url: showImageURL,
                    placeholder: { Text("Loading...") },
                    image: { Image(uiImage: $0).resizable() }
                )
                .frame(width: 100, height: 100, alignment: .center)
            }

            VStack(alignment: .leading) {
                Text("\(model.firstName) \(model.lastName)")
                    .font(.headline)
            }
        }
        .padding(8)
        .cornerRadius(8)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(
            id: 1,
            email: "johndoe@email.com",
            firstName: "John",
            lastName: "Doe",
            avatarURL: "https://reqres.in/img/faces/7-image.jpg"
        )
        UserCell(model: user)
    }
}
