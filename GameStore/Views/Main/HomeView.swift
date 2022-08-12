//
//  HomeView.swift
//  GameStore
//
//  Created by Hafid Ikhsan Arifin on 12/08/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            Text("Home Page")
                .navigationTitle("Home")
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
