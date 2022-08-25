//
//  DetailView.swift
//  GameStore
//
//  Created by Hafid Ikhsan Arifin on 17/08/22.
//

import SwiftUI

struct DetailView: View {
    var id: Int
    @ObservedObject var services = Services()
    init(id: Int) {
        self.id = id
        services.status = .initialized
    }
    var body: some View {
        switch services.status {
        case .initialized:
            ZStack {
                Color.white
                ProgressView()
            }.task {
                services.getUrlDetail(endPoint: "games", value: self.id)
            }
        case .loaded:
            ScrollView {
                AsyncImage(url: URL(string: (services.detail?.backgroundImage)!)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 300)
                .frame(maxWidth: .infinity)
                VStack(alignment: .leading) {
                    HStack {
                        Text(services.detail!.name)
                            .font(.title2.weight(.bold))
                        Spacer()
                    }
                    Text(services.detail!.description)
                        .font(.body.weight(.regular))
                    HStack(alignment: .center) {
                        Image(systemName: "r.square.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color("PrimaryColor"))
                        Text(services.detail!.released!)
                            .font(.headline.weight(.bold))
                    }.padding(.top)
                    HStack(alignment: .center) {
                        Image(systemName: "star.square")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color("PrimaryColor"))
                        Text(String(services.detail!.rating))
                            .font(.headline.weight(.bold))
                    }.padding(.top)
                    HStack(alignment: .center) {
                        Image(systemName: "network")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color("PrimaryColor"))
                        Text(services.detail!.website)
                            .font(.headline.weight(.bold))
                    }.padding(.top)
                }
                .padding()
                .padding(.bottom, 60)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .offset(y: -40)
            }.ignoresSafeArea()
                .navigationTitle(services.detail!.name)
                .navigationBarTitleDisplayMode(.inline)
        case .failed:
            ZStack {
                Color.white
                Text("Failed")
            }
        case .fetching:
            ZStack {
                Color.white
                ProgressView()
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(id: 123)
    }
}
