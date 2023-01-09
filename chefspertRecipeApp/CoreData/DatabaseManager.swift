import CoreData
import Foundation

class DatabaseManager{
    let container =  NSPersistentContainer(name: "FoodDatabase")
    init(){
        container.loadPersistentStores { description, error in
            if let error = error{
                print("falied \(error.localizedDescription)")
            }
        }
    }
}
