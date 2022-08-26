import Foundation

struct MenuProperties: Identifiable {
    let menu: Menu
    let icon: String
    let text: String
    let value: String
    var id: Menu { menu }
}

let menuProperties: [MenuProperties] = [
    MenuProperties(menu: .action, icon: "ActionIcon", text: "Action", value: "action"),
    MenuProperties(menu: .puzzle, icon: "PuzzleIcon", text: "Puzzle", value: "puzzle"),
    MenuProperties(menu: .sport, icon: "SportIcon", text: "Sport", value: "sports"),
    MenuProperties(menu: .strategy, icon: "StrategyIcon", text: "Strategy", value: "strategy")
]
