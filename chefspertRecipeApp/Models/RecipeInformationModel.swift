//import Foundation
//
//// MARK: - RecipeInformationSearch
//struct RecipeInformationSearch: Codable {
//    let vegetarian, vegan, glutenFree, dairyFree: Bool
//    let veryHealthy, cheap, veryPopular, sustainable: Bool
//    let preparationMinutes, cookingMinutes, aggregateLikes, healthScore: Int
//    let id: Int
//    let title: String
//    let readyInMinutes, servings: Int
//    let analyzedInstructions: [AnalyzedInstruction]?
//
//    enum CodingKeys: String, CodingKey {
//        case id, title, readyInMinutes, servings
//        case vegetarian, vegan, glutenFree, dairyFree
//        case veryHealthy, cheap, veryPopular, sustainable
//        case preparationMinutes, cookingMinutes, aggregateLikes, healthScore
//        case analyzedInstructions
//
//    }
//
//    // MARK: - AnalyzedInstruction
//    struct AnalyzedInstruction: Codable {
//        let name: String?
//        let steps: [Step]?
//    }
//    // MARK: - Step
//    struct Step: Codable {
//        let number: Int?
//        let step: String?
//        let ingredients, equipment: [Ent]?
//    }
//    // MARK: - Ent
//    struct Ent: Codable {
//        let id: Int?
//        let name, localizedName, image: String?
//    }
//}
