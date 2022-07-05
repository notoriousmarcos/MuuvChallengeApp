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
                Text(model.email)
                    .lineLimit(4)
                    .font(.subheadline)
            }
        }
        .padding(8)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.primary, lineWidth: 1)
        )
        .padding(8)
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
