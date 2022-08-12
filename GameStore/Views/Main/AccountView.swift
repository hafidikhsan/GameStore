//
//  AccountView.swift
//  GameStore
//
//  Created by Hafid Ikhsan Arifin on 12/08/22.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            Text("Account Page")
                .navigationTitle("Account")
        }
        .navigationViewStyle(.stack)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
