//
//  AccountView.swift
//  GameStore
//
//  Created by Hafid Ikhsan Arifin on 12/08/22.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ZStack(alignment: .top) {
                    Color("PrimaryColor").frame(height: 150)
                    VStack {
                        Spacer().frame(height: 80)
                        Image("HafidIkhsanArifin")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(Circle()
                                .stroke(Color.white, lineWidth: 3))
                        Text("Hafid Ikhsan Arifin")
                            .font(.title2.weight(.bold))
                            .padding(.top)
                        Text("Dicoding Academy iOS Developer")
                            .font(.headline.weight(.regular))
                            .foregroundColor(Color.gray)
                            .padding(.bottom)
                    }
                }
                .navigationTitle("About Me")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
