import Foundation
import SwiftUI

class HomeScreenViewModel: ObservableObject{
    var networking = RecipeNetworkManager()
    
    @Published var searchText: String = ""
    @Published var searching = false
    @Published var searchedResultList: [Result] = []
    @Published var allRecipeResultList: [Result] = []
    @Published var recipeInformationArray: [RecipeInformationSearch] = []
    @Published var vegeterianRecipes: [Result] = []
   
    //func to fetch all recipes
    func fetchAllRecipes(){
        networking.fetchAllRecipes { result in
            self.allRecipeResultList = result.results
        }
    }
    //func to fetch diet specific recipes
    func fetchVegeterianRecipes(){
        networking.fetchVegeterianRecipes { recipe in
            self.vegeterianRecipes = recipe.results
        }
    }
    
    //func to fetch food
    func fetchSearchedFood(searched food: String){
        networking.fetchSearchedRecipes(for: food.lowercased(), completion: { data in
            self.searchedResultList = data.results
                            for i in 0...(data.results.count - 1 ){
                            self.networking.fetchRecipeInformation(for: data.results[i].id) { info in
                                self.recipeInformationArray = [info]
                            }
                        }

        })
    }
 
    
    
}

