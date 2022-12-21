import Foundation
class HomeScreenViewModel: ObservableObject{
    
    @Published var searchText: String = ""
    @Published var searching = false
    
    var networking = RecipeNetworkManager()
    var favoriteList: [Result] = []
    
    func fetchSearchedFood(searched food: String){
        networking.fetchRandomRecipes(for: food.lowercased(), completion: { data in
            self.favoriteList = data.results
        })
    }
    
}
