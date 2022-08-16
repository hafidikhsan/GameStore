//
//  MenuListView.swift
//  GameStore
//
//  Created by Hafid Ikhsan Arifin on 16/08/22.
//

import SwiftUI

struct MenuListView: View {
    var genre: String
    var value: String
    @ObservedObject var services = Services()
    init(genre: String, value: String) {
        self.genre = genre
        self.value = value
        services.status = .initialized
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor(Color("PrimaryColor"))
        navBarAppearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().tintColor = .white
    }
    var body: some View {
        switch services.status {
        case .failed:
            ZStack {
                Text("Error")
            }
            .ignoresSafeArea()
            .navigationTitle(genre)
            .navigationBarTitleDisplayMode(.inline)
        case .loaded:
            ZStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(services.menuList!.results, id: \.id) { list in
                            MenuListRowView(game: list)
                                .padding(.horizontal)
                                .padding(.bottom)
                        }
                    }
                    .padding(.bottom, 60)
                    .padding(.top)
                }
            }
            .navigationTitle(genre)
            .navigationBarTitleDisplayMode(.inline)
        case .fetching:
            ZStack {
                Color.white
                ProgressView()
            }
            .ignoresSafeArea()
            .navigationTitle(genre)
            .navigationBarTitleDisplayMode(.inline)
        default:
            ZStack {
                Color.red
                ProgressView()
            }.task {
                services.getUrlMenuList(endPoint: "games", value: value)
            }
            .ignoresSafeArea()
            .navigationTitle(genre)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView(genre: "Haloo", value: "halo")
    }
}
