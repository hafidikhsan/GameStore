import SwiftUI

struct TabBarView: View {
    @State var selectedItem: Tab = .home
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                Group {
                    switch selectedItem {
                    case .home:
                        HomeView()
                    case .search:
                        SearchView()
                    case .favorite:
                        FavouriteView()
                    case .account:
                        AccountView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack {
                    ForEach(tabBarProperties) { item in
                        Button {
                            self.selectedItem = item.tab
                        } label: {
                            VStack(spacing: 5) {
                                Image(item.icon)
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                Text(item.text)
                                    .font(.caption2.bold())
                                    .lineLimit(1)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .foregroundColor(selectedItem == item.tab ? Color.primaryColor : Color.gray)
                    }
                }
                .padding(.horizontal, 5)
                .frame(height: 90)
                .background(.white)
                .cornerRadius(radius: 30.0, corners: [.topLeft, .topRight])
                .shadow(color: .black, radius: 10, y: 10)
            }.ignoresSafeArea()
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
