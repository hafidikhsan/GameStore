//
//  HomeListRowView.swift
//  GameStore
//
//  Created by Hafid Ikhsan Arifin on 13/08/22.
//

import SwiftUI

struct HomeListRowView: View {
    let game: GameList
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2)
            HStack(alignment: .top, spacing: 15) {
                AsyncImage(url: URL(string: game.backgroundImage)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                VStack(alignment: .leading) {
                    Text(game.name)
                        .font(.title3.weight(.bold))
                        .lineLimit(1)
                        .foregroundColor(Color.black)
                    HStack(alignment: .bottom) {
                        VStack {
                            Text(game.genres[0].name)
                                .font(.headline.weight(.medium))
                                .lineLimit(1)
                            .foregroundColor(Color.gray)
                            Spacer()
                        }
                        Spacer()
                        ZStack {
                            Color("PrimaryColor")
                            Text("Install")
                                .font(.headline.weight(.medium))
                                .lineLimit(1)
                                .foregroundColor(Color.white)
                        }.frame(width: 100, height: 35)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }.frame(maxHeight: .infinity)
                }
            }.frame(height: 80).padding()
        }.frame(height: 110)
            .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

struct HomeListRowView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyData = GameList(
            id: 1,
            slug: "Dummy",
            name: "Dummy Data To Long",
            released: "Dummy",
            backgroundImage: "Dummy",
            rating: 12,
            genres: [
                Genres(id: 1, slug: "Dummy", name: "Dummy")
            ]
        )
        HomeListRowView(game: dummyData)
    }
}
