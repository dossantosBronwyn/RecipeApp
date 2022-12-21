import Foundation


    // MARK: - ComplexSearch
    struct ComplexRecipeSearch: Codable {
        let results: [Result]
        let offset, number, totalResults: Int
    }

    // MARK: - ComplexSearch - Result
    struct Result: Codable {
        let id: Int
        let title: String
        let image: String
        let imageType: ImageType
    }

    enum ImageType: String, Codable {
        case jpg = "jpg"
    }

    
//    // MARK: - RecipeInformationSearch
//    struct RecipeInformationSearch: Codable {
//        let vegetarian, vegan, glutenFree, dairyFree: Bool
//        let veryHealthy, cheap, veryPopular, sustainable: Bool
//        let preparationMinutes, cookingMinutes, healthScore: Int
//        let extendedIngredients: [ExtendedIngredient]
//        let id: Int
//        let title: String
//        let readyInMinutes, servings: Int
//        let sourceURL: String
//        let image: String
//        let imageType, summary: String
//        let cuisines, dishTypes: [String]
//        let instructions: String
//        let analyzedInstructions: [AnalyzedInstruction]
//
//        enum CodingKeys: String, CodingKey {
//            case vegetarian, vegan, glutenFree, dairyFree, veryHealthy, cheap, veryPopular, sustainable, lowFodmap, weightWatcherSmartPoints, gaps, preparationMinutes, cookingMinutes, aggregateLikes, healthScore, creditsText, sourceName, pricePerServing, extendedIngredients, id, title, readyInMinutes, servings
//            case sourceURL = "sourceUrl"
//            case image, imageType, summary, cuisines, dishTypes, diets, occasions,  instructions, analyzedInstructions
//
//        }
//    }
//
//    // MARK: RecipeInformationSearch - AnalyzedInstruction
//    struct AnalyzedInstruction: Codable {
//        let name: String
//        let steps: [Step]
//    }
//
//    // MARK:  RecipeInformationSearch - Step
//    struct Step: Codable {
//        let number: Int
//        let step: String
//        let ingredients, equipment: [Ent]
//        let length: Length?
//    }
//
//    // MARK: RecipeInformationSearch - Ent
//    struct Ent: Codable {
//        let id: Int
//        let name, localizedName, image: String
//        let temperature: Length?
//    }
//
//    // MARK: RecipeInformationSearch - Length
//            struct Length: Codable {
//                let number: Int
//                let unit: String
//            }
//
//            // MARK: RecipeInformationSearch - ExtendedIngredient
//            struct ExtendedIngredient: Codable {
//                let id: Int
//                let aisle, image: String
//                let consistency: Consistency
//                let name, nameClean, original, originalName: String
//                let amount: Double
//                let unit: String
//                let meta: [String]
//                let measures: Measures
//            }
//
//            enum Consistency: String, Codable {
//                case liquid = "LIQUID"
//                case solid = "SOLID"
//            }
//
//            // MARK: RecipeInformationSearch - Measures
//            struct Measures: Codable {
//                let us, metric: Metric
//            }
//
//            // MARK: RecipeInformationSearch - Metric
//            struct Metric: Codable {
//                let amount: Double
//                let unitShort, unitLong: String
//            }
    

