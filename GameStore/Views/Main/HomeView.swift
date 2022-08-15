//
//  HomeView.swift
//  GameStore
//
//  Created by Hafid Ikhsan Arifin on 12/08/22.
//

import SwiftUI

struct HomeView: View {
    let navBarAppearance = UINavigationBarAppearance()
    init() {
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor(Color("PrimaryColor"))
        navBarAppearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().tintColor = .clear
    }
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color("PrimaryColor")
                ScrollView {
                    GeometryReader { reader in
                        let value = reader.frame(in: .global).minY / 2
                        HomeBackgroundView(zoomValue: .constant(value))
                    }.frame(height: 300)
                    VStack(alignment: .leading) {
                        HomeMenuView()
                        Text("Newest Game")
                            .font(.title2.weight(.bold))
                            .lineLimit(1)
                            .foregroundColor(Color.black)
                            .padding(.leading)
                        ForEach((1...10), id: \.self) {_ in
                            HomeListRowView()
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
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
