import Foundation


    // MARK: - ComplexSearch
    struct ComplexRecipeSearch: Codable {
        let results: [Result]
        let offset, number, totalResults: Int
    }

    // MARK: - ComplexSearch - Result
    struct Result: Codable, Hashable {
        let id: Int
        let title: String
        let image: String
        let imageType: ImageType
    }

    enum ImageType: String, Codable {
        case jpg = "jpg"
    }

