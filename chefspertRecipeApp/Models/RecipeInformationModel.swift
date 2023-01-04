// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let recipeInformationSearch = try? newJSONDecoder().decode(RecipeInformationSearch.self, from: jsonData)

import Foundation

// MARK: - RecipeInformationSearch
struct RecipeInformationSearch: Codable {
    let vegetarian, vegan, glutenFree, dairyFree: Bool
    let veryHealthy, cheap, veryPopular, sustainable: Bool
    let preparationMinutes, cookingMinutes, aggregateLikes, healthScore: Int
    let id: Int
    let title: String
    let readyInMinutes, servings: Int
    
}
