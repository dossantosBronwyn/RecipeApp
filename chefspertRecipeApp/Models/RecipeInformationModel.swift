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
