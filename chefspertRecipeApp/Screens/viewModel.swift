import Foundation
import SwiftUI

class ViewModel: ObservableObject{
    var networking = RecipeNetworkManager()
    
    @Published var searchText: String = ""
    @Published var searching = false
    @Published var searchedResultList: [Result] = []
    @Published var allRecipeResultList: [Result] = []
    @Published var vegeterianRecipes: [Result] = []
    @Published var pescetarianRecipes: [Result] = []
    @Published var randomRecipes: [Result] = []
    @Published var recipeInformation: RecipeInformationSearch?
   
    // MARK:- Fetch all recipes
    func fetchAllRecipes(){
        networking.fetchAllRecipes { result in
            self.allRecipeResultList = result.results
        }
    }
   
    // MARK:- Fetch diet specific
    func fetchDietSpecificRecipes(){
        networking.fetchDietSpecificRecipes(for: "vegeterian") {recipe in
            self.vegeterianRecipes = recipe.results
        }
        networking.fetchDietSpecificRecipes(for: "pescetarian") {recipe in
            self.pescetarianRecipes = recipe.results
        }
        
    }
    // MARK:- Fetch searched food
    func fetchSearchedFood(searched food: String){
        networking.fetchSearchedRecipes(for: food.lowercased()){data in
            self.searchedResultList = data.results
                        }
        }
    // MARK:- Fetch recipe info
    func fetchRecipeInfortmation(id: Int){
        networking.fetchRecipeInformation(for: id) { recipeInfo in
            self.recipeInformation = recipeInfo
        }
    }
    
}

