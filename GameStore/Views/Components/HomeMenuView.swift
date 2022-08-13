//
//  HomeMenuView.swift
//  GameStore
//
//  Created by Hafid Ikhsan Arifin on 13/08/22.
//

import SwiftUI

struct HomeMenuView: View {
    var body: some View {
        HStack {
            ForEach((1...4), id: \.self) {_ in
                VStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.green)
                    .frame(width: 70, height: 70)
                    .frame(maxWidth: .infinity)
                    Text("Haloo")
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

struct HomeMenuView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMenuView()
    }
}
