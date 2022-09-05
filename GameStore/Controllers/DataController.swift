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
        } catch {
            fatalError("Opps, Can't Save Data")
        }
    }
    func addFav(favorite: FavoriteModel, context: NSManagedObjectContext) {
        let fav = Favorite(context: context)
        fav.id = Int64(favorite.id)
        fav.name = favorite.name
        fav.image = favorite.backgroundImage
        fav.realesed = favorite.released
        fav.rating = favorite.rating
        saveFav(context: context)
    }
}
