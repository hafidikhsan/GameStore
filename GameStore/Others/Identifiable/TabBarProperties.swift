import Foundation

struct TabBarProperties: Identifiable {
    let tab: Tab
    let icon: String
    let text: String
    var id: Tab { tab }
}

let tabBarProperties: [TabBarProperties] = [
    TabBarProperties(tab: .home, icon: "HomeIcon", text: "Home"),
    TabBarProperties(tab: .search, icon: "SearchIcon", text: "Search"),
    TabBarProperties(tab: .favorite, icon: "FavoriteIcon", text: "Favorite"),
    TabBarProperties(tab: .account, icon: "AccountIcon", text: "Account")
]
