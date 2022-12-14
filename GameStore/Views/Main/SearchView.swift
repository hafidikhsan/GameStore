import SwiftUI

struct SearchView: View {
    @State var value: String = ""
    @ObservedObject var services = Services()
    init() {
        services.status = .initialized
    }
    func performSearch() {
        services.getUrlSearchList(endPoint: "games", value: value)
    }
    var body: some View {
        ZStack(alignment: .top) {
            Color.white
            ScrollView {
                switch services.status {
                case .initialized:
                    VStack(alignment: .center) {
                        Image(systemName: "gamecontroller.fill")
                            .foregroundColor(Color.primaryColor)
                        Text("Find Your Game")
                            .padding(.top)
                    }
                case .failed:
                    VStack(alignment: .center) {
                        Image(systemName: "exclamationmark.circle.fill")
                            .foregroundColor(Color.primaryColor)
                        Text("Opps, Something Went Wrong")
                            .padding(.top)
                        Text(services.message)
                            .padding(.top)
                    }
                case .fetching:
                    ZStack {
                        ProgressView()
                    }
                case .loaded:
                    if services.searchList?.results == nil {
                        VStack(alignment: .center) {
                            Image(systemName: "exclamationmark.circle.fill")
                                .foregroundColor(Color.primaryColor)
                            Text("Opps, Can't Find Your Game")
                                .padding(.top)
                        }
                    } else {
                        VStack(alignment: .leading) {
                            ForEach(services.searchList!.results, id: \.id) { list in
                                MenuListRowView(game: list)
                                    .padding(.horizontal)
                                    .padding(.bottom)
                            }
                        }
                        .padding(.bottom, 100)
                    }
                }
            }.padding(.top, 170)
            VStack {
                Text("Search")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.top, 50)
                HStack {
                    TextField(
                        "Find Game",
                        text: $value,
                        onCommit: performSearch
                    ).textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: performSearch) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                    }
                }
            }.padding()
                .frame(maxWidth: .infinity)
                .background(Color.primaryColor)
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
