//
//  TabBarProperties.swift
//  GameStore
//
//  Created by Hafid Ikhsan Arifin on 12/08/22.
//

import Foundation

struct TabBarProperties: Identifiable {
    let tab: Tab
    let icon: String
    let text: String
    var id: Tab { tab }
}

let tabBarProperties: [TabBarProperties] = [
    TabBarProperties(tab: .home, icon: "house.fill", text: "Home"),
    TabBarProperties(tab: .search, icon: "magnifyingglass", text: "Search"),
    TabBarProperties(tab: .account, icon: "person.fill", text: "Account")
]
