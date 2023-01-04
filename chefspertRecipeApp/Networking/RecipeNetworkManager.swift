import Foundation

// create a URL + Session

class RecipeNetworkManager {
    let apiKey = "969493ec42a540f3810c3ad7bcb5da93"
    var complexRecipe: ComplexRecipeSearch?
    var recipeInformation: RecipeInformationSearch?
    
    func fetchAllRecipes(completion: @escaping (ComplexRecipeSearch) -> ()){
       
        let url = "https://api.spoonacular.com/recipes/complexSearch?apiKey=\(apiKey)&number=5"
        
        guard let safeURL =  URL(string: url)  else { return }
        //Create a request
        let request = URLRequest(url: safeURL)
        //create a service group for async calls
        let serviceGroup = DispatchGroup()
        serviceGroup.enter()
        
        //create a task
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            guard let data = data else{return}
            do{
                //decode data
                let decodedData = try JSONDecoder().decode(ComplexRecipeSearch.self, from: data)
                self.complexRecipe = decodedData
                serviceGroup.leave()
                
            }catch let error{
                print(error.localizedDescription)
            }
            
            print(" ive called all recipes")
        }
        task.resume()
        
        serviceGroup.notify(queue: DispatchQueue.global()){ [weak self] in
            DispatchQueue.main.async {
                guard let safeComplexRecipe = self?.complexRecipe else {return}
                completion(safeComplexRecipe)
            }
            
        }
    }
        
        func fetchRandomRecipes(for foodSearch: String, completion: @escaping (ComplexRecipeSearch) -> ()){
            print("fetching the search result")
            let url = "https://api.spoonacular.com/recipes/complexSearch?apiKey=\(apiKey)&query=\(foodSearch)"
            
            guard let safeURL =  URL(string: url)  else { return }
            //Create a request
            let request = URLRequest(url: safeURL)
            
            //create a service group for async calls
            let serviceGroup = DispatchGroup()
            serviceGroup.enter()
            
            //create a task
            let task = URLSession.shared.dataTask(with: request){ data, response, error in
                guard let data = data else{return}
                do{
                    //decode data
                    let decodedData = try JSONDecoder().decode(ComplexRecipeSearch.self, from: data)
                    self.complexRecipe = decodedData
                    serviceGroup.leave()
                    
                }catch let error{
                    print(error.localizedDescription)
                }
                
                
            }
            task.resume()
            
            serviceGroup.notify(queue: DispatchQueue.global()){ [weak self] in
                DispatchQueue.main.async {
                    guard let safeComplexRecipe = self?.complexRecipe else {return}
                    completion(safeComplexRecipe)
                }
                
            }
        }
        
        
        
        
        
        
        
        
        func fetchRecipeInformation(for id: Int, completion: @escaping (RecipeInformationSearch) ->()){
            let url = "https ://api.spoonacular.com/recipes/\(id)/information&apiKey=\(apiKey)"
            
            guard let safeURL = URL(string: url) else {return}
            let request = URLRequest(url: safeURL)
            
            let serviceGroup = DispatchGroup()
            serviceGroup.enter()
            
            let task = URLSession.shared.dataTask(with: request){ data, response, error in
                guard let data = data else {return}
                do{
                    let decodedData = try JSONDecoder().decode(RecipeInformationSearch.self, from: data)
                    self.recipeInformation = decodedData
                    serviceGroup.leave()
                }catch let error{
                    print(error.localizedDescription)
                }
            }
            task.resume()
            
        }
        

  
   
}

