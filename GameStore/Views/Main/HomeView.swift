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
            ZStack(alignment: .top) {
                Color.white
                ScrollView {
                    HomeBackgroundView()
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
