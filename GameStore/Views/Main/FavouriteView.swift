//
//  FavouriteView.swift
//  GameStore
//
//  Created by Hafid Ikhsan Arifin on 05/09/22.
//

import SwiftUI

struct FavouriteView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: []) var favourite: FetchedResults<Favorite>
    var body: some View {
        ZStack(alignment: .top) {
            Color.white
            ScrollView {
                if favourite.isEmpty {
                    VStack(alignment: .center) {
                        Image(systemName: "gamecontroller.fill")
                            .foregroundColor(Color.primaryColor)
                        Text("Favourite is Empty")
                            .padding(.top)
                    }
                } else {
                    VStack(alignment: .leading) {
                        ForEach(favourite, id: \.id) { list in
                            FavouriteListRowView(game: list)
                                .padding(.horizontal)
                                .padding(.bottom)
                        }
                    }
                    .padding(.bottom, 100)
                }
            }.padding(.top, 130)
            VStack {
                Text("Favourite")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.top, 50)
            }.padding()
                .frame(maxWidth: .infinity)
                .background(Color.primaryColor)
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
