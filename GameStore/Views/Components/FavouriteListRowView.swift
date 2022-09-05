//
//  FavouriteListRowView.swift
//  GameStore
//
//  Created by Hafid Ikhsan Arifin on 05/09/22.
//

import SwiftUI

struct FavouriteListRowView: View {
    let game: Favorite
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2)
            HStack(alignment: .center, spacing: 15) {
                if game.image == nil {
                    Image(systemName: "exclamationmark.circle.fill")
                        .foregroundColor(Color("PrimaryColor"))
                        .frame(width: 80, height: 80)
                } else {
                    AsyncImage(url: URL(string: game.image!)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .scaledToFill()
                    .frame(width: 85, height: 85)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text(game.name!)
                            .font(.title3.weight(.bold))
                            .lineLimit(1)
                        .foregroundColor(Color.black)
                        Spacer()
                        HStack(alignment: .center) {
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundColor(Color.gray)
                            Text(String(game.rating))
                                .font(.subheadline.weight(.medium))
                                .foregroundColor(Color.gray)
                        }
                    }
                    HStack(alignment: .bottom) {
                        if game.realesed == nil {
                            EmptyView()
                        } else {
                            VStack(alignment: .leading) {
                                HStack(alignment: .center) {
                                    Image(systemName: "r.square.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(Color.gray)
                                    Text(game.realesed!)
                                        .font(.subheadline.weight(.medium))
                                        .foregroundColor(Color.gray)
                                }
                            }
                        }
                        Spacer()
                        NavigationLink(destination: DetailView(id: Int(game.id))) {
                            ZStack {
                                Color("PrimaryColor")
                                Text("Detail")
                                    .font(.headline.weight(.medium))
                                    .lineLimit(1)
                                    .foregroundColor(Color.white)
                            }.frame(width: 100, height: 35)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                    }.frame(maxHeight: .infinity)
                }
            }.frame(height: 80).padding()
        }.frame(height: 110)
            .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

struct FavouriteListRowView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteListRowView(game: Favorite())
    }
}
