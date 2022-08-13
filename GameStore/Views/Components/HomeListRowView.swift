//
//  HomeListRowView.swift
//  GameStore
//
//  Created by Hafid Ikhsan Arifin on 13/08/22.
//

import SwiftUI

struct HomeListRowView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2)
            HStack(alignment: .top, spacing: 15) {
                Image("HafidIkhsanArifin")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 80, height: 80)
                VStack(alignment: .leading) {
                    Text("Judul Nih")
                        .font(.title3.weight(.bold))
                        .lineLimit(1)
                        .foregroundColor(Color.black)
                    Text("Tema")
                        .font(.headline.weight(.medium))
                        .lineLimit(1)
                        .foregroundColor(Color.gray)
                }
                Spacer()
                VStack {
                    Spacer()
                    ZStack {
                        Color.blue
                        Text("Install")
                            .font(.headline.weight(.medium))
                            .lineLimit(1)
                            .foregroundColor(Color.white)
                    }.frame(width: 100, height: 35)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }.frame(height: 80).padding()
        }.frame(height: 110)
            .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

struct HomeListRowView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListRowView()
    }
}
