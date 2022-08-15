//
//  MenuProperties.swift
//  GameStore
//
//  Created by Hafid Ikhsan Arifin on 15/08/22.
//

import Foundation

struct MenuProperties: Identifiable {
    let menu: Menu
    let icon: String
    let text: String
    var id: Menu { menu }
}

let menuProperties: [MenuProperties] = [
    MenuProperties(menu: .action, icon: "ActionIcon", text: "Action"),
    MenuProperties(menu: .puzzle, icon: "PuzzleIcon", text: "Puzzle"),
    MenuProperties(menu: .sport, icon: "SportIcon", text: "Sport"),
    MenuProperties(menu: .strategy, icon: "StrategyIcon", text: "Strategy")
]
