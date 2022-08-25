//
//  HomeMenuView.swift
//  GameStore
//
//  Created by Hafid Ikhsan Arifin on 13/08/22.
//

import SwiftUI

struct HomeMenuView: View {
    var genre: String
    var icon: String
    var body: some View {
        VStack {
            ZStack {
                Color("PrimaryColor")
                Image(icon)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .frame(width: 70, height: 70)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            Text("\(genre)")
                .foregroundColor(Color.black)
        }
    }
}

struct HomeMenuView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMenuView(genre: "SportIcon", icon: "Sport")
    }
}
