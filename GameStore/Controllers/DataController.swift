//
//  DataController.swift
//  GameStore
//
//  Created by Hafid Ikhsan Arifin on 05/09/22.
//

import CoreData
import Foundation

struct DataController {
    static let shared = DataController()
    let container: NSPersistentContainer
    init() {
        container = NSPersistentContainer(name: "Favourite")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Load failed: \(error.localizedDescription)")
            }
        }
    }
    func saveFav(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Yeay, Success Save Data")
        } catch {
            print("Opps, Can't Save Data")
        }
    }
    func addFav(id: Int, name: String, image: String?, realesed: String?, rating: Double, context: NSManagedObjectContext) {
        let fav = Favorite(context: context)
        fav.id = Int16(id)
        fav.name = name
        fav.image = image
        fav.realesed = realesed
        fav.rating = rating
        saveFav(context: context)
    }
}
