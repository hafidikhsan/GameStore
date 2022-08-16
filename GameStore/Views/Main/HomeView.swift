//
//  HomeView.swift
//  GameStore
//
//  Created by Hafid Ikhsan Arifin on 12/08/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var services = Services()
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor(Color("PrimaryColor"))
        navBarAppearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().tintColor = .white
    }
    var body: some View {
        switch services.status {
        case .failed:
            ZStack {
                Text("Error")
            }
        case .loaded:
            if services.homeList != nil {
                NavigationView {
                    ZStack(alignment: .top) {
                        Color("PrimaryColor")
                            .frame(height: 500)
                        ScrollView {
                            GeometryReader { reader in
                                let value = reader.frame(in: .global).minY / 2
                                HomeBackgroundView(zoomValue: .constant(value))
                            }.frame(height: 300)
                            VStack(alignment: .leading) {
                                HStack {
                                    ForEach(menuProperties) { item in
                                        NavigationLink(destination: MenuListView(
                                            genre: item.text,
                                            value: item.value
                                        )) {
                                            HomeMenuView(genre: item.text, icon: item.icon)
                                        }
                                    }
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                Text("Games")
                                    .font(.title2.weight(.bold))
                                    .lineLimit(1)
                                    .foregroundColor(Color.black)
                                    .padding(.leading)
                                ForEach(services.homeList!.results, id: \.id) { list in
                                    HomeListRowView(game: list)
                                        .padding(.horizontal)
                                        .padding(.bottom)
                                }
                            }
                            .padding(.bottom, 60)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .offset(y: -40)
                        }.ignoresSafeArea()
                    }
                    .ignoresSafeArea()
                    .navigationTitle("Game Store")
                }
                .navigationViewStyle(.stack)
            } else {
                ZStack {
                    Text("Error nil")
                }
            }
        default :
            ZStack {
                Color.white
                ProgressView()
            }
            .task {
                services.getUrlHomeList(endPoint: "games")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
