//
//  SearchView.swift
//  GameStore
//
//  Created by Hafid Ikhsan Arifin on 12/08/22.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationView {
            Text("Search Page")
                .navigationTitle("Search")
        }
        .navigationViewStyle(.stack)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
