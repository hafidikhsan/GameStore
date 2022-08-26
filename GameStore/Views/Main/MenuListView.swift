//
//  MenuListView.swift
//  GameStore
//
//  Created by Hafid Ikhsan Arifin on 16/08/22.
//

import SwiftUI

struct MenuListView: View {
    var genre: String
    var value: String
    @ObservedObject var services = Services()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    init(genre: String, value: String) {
        self.genre = genre
        self.value = value
        services.status = .initialized
    }
    var body: some View {
        switch services.status {
        case .failed:
            ZStack {
                Text("Error")
            }
            .ignoresSafeArea()
            .navigationTitle(genre)
            .navigationBarTitleDisplayMode(.inline)
        case .loaded:
            ZStack(alignment: .top) {
                Color.white
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(services.menuList!.results, id: \.id) { list in
                            NavigationLink(destination: DetailView(id: list.id)) {
                                HomeListRowView(game: list)
                                    .padding(.horizontal)
                                    .padding(.bottom)
                            }
                        }
                    }
                    .padding(.bottom, 60)
                    .padding(.top, 100)
                }
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.backward")
                            .scaledToFit()
                            .foregroundColor(.white)
                    })
                    Spacer()
                    Text(genre)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                .padding()
                .frame(height: 80)
                .frame(maxWidth: .infinity)
                .background(Color("PrimaryColor"))
            }
            .navigationTitle(genre)
            .navigationBarHidden(true)
        case .fetching:
            ZStack {
                Color.white
                ProgressView()
            }
            .ignoresSafeArea()
            .navigationTitle(genre)
            .navigationBarTitleDisplayMode(.inline)
        default:
            ZStack {
                Color.red
                ProgressView()
            }.task {
                services.getUrlMenuList(endPoint: "games", value: value)
            }
            .ignoresSafeArea()
            .navigationTitle(genre)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView(genre: "Haloo", value: "halo")
    }
}
