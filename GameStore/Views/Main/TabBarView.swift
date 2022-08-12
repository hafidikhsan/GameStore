//
//  TabBarView.swift
//  GameStore
//
//  Created by Hafid Ikhsan Arifin on 12/08/22.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person.fill")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
