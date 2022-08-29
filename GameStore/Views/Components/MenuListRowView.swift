import SwiftUI

struct MenuListRowView: View {
    let game: GameList
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2)
            HStack(alignment: .center, spacing: 15) {
                if game.backgroundImage == nil {
                    Image(systemName: "exclamationmark.circle.fill")
                        .foregroundColor(Color("PrimaryColor"))
                        .frame(width: 80, height: 80)
                } else {
                    AsyncImage(url: URL(string: game.backgroundImage!)) { image in
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
                        Text(game.name)
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
                        if game.genres == nil || game.released == nil {
                            EmptyView()
                        } else {
                            VStack(alignment: .leading) {
                                if let genre = game.genres {
                                    if genre.isEmpty {
                                        EmptyView()
                                    } else {
                                        Text(genre[0].name)
                                        .font(.subheadline.weight(.medium))
                                        .lineLimit(1)
                                        .foregroundColor(Color.gray)
                                    }
                                }
                                HStack(alignment: .center) {
                                    Image(systemName: "r.square.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(Color.gray)
                                    Text(game.released!)
                                        .font(.subheadline.weight(.medium))
                                        .foregroundColor(Color.gray)
                                }
                            }
                        }
                        Spacer()
                        NavigationLink(destination: DetailView(id: game.id)) {
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

struct MenuListRowView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyData = GameList(
            id: 1,
            slug: "Dummy",
            name: "Dummy Data To Long",
            released: "Dummy",
            backgroundImage: "Dummy",
            rating: 12,
            genres: nil
        )
        MenuListRowView(game: dummyData)
    }
}
