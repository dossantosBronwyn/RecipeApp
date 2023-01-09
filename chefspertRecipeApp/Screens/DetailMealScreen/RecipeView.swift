import SwiftUI
import CoreData

struct RecipeView: View {
    @FetchRequest(sortDescriptors: []) var favourites: FetchedResults<Favourite>
    @Environment(\.managedObjectContext) var context
    @EnvironmentObject var viewModel: ViewModel
    var recipe: Result
    
    
    var body: some View {
        ScrollView{
            AsyncImage(url: URL(string:recipe.image)){ image in
                image
                    .resizable()
                    .aspectRatio( contentMode: .fill)
            }
        placeholder: {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(.white.opacity(0.7))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(height: 300)
        .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3),Color(.gray)]), startPoint: .top, endPoint: .bottom))
            VStack(spacing: 30){
                Text(recipe.title)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                
                HStack{
                    if recipe.veryPopular == true{
                        VStack{
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("Popularity")
                        }
                        .padding()
                    }else{
                        VStack{
                            Image(systemName: "star.slash.fill")
                                .foregroundColor(.gray)
                            Text("Popularity")
                        }
                        .padding()
                    }
                    if recipe.veryHealthy == true{
                        VStack{
                            Image(systemName: "leaf.fill")
                                .foregroundColor(.green)
                            Text("Healthy")
                        }
                        .padding()
                    }else{
                        VStack{
                            Image(systemName: "leaf")
                                .foregroundColor(.gray)
                            Text("Healthy")
                        }
                        .padding()
                    }
                }
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        foodSpecification(title: "Prep time", infoSlot: "\(recipe.preparationMinutes < 1 ? "0 min" : "\(recipe.preparationMinutes)mins")")
                        foodSpecification(title: "Likes", infoSlot: "\(recipe.aggregateLikes)")
                        foodSpecification(title: "Health", infoSlot: "\(recipe.healthScore)")
                        foodSpecification(title: "Serves", infoSlot: "\(recipe.servings)")
                        foodSpecification(title: "Cook", infoSlot:  "\(recipe.cookingMinutes < 1 ? "0 min" : "\(recipe.cookingMinutes)mins")")
                    }
                    
                }

                    VStack{
                        Text("Directions")
                            .font(.headline)
                        Text("no directions found")
                        List {
                            ForEach(viewModel.ingredientArray, id: \.self){ item in
                                Text(item)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .listRowBackground(Color(.red))
                            }
                        }
                    }
                    

            }
            .padding(.horizontal)
        }
        .onAppear(){
        
        }
        .ignoresSafeArea(.container, edges: .top)
    }
    
    func addToFavourites(){
        let favouriteRecipe = Favourite(context: context)
        favouriteRecipe.title
        
    }
}


//struct RecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeView()
//    }
//}

struct foodSpecification: View {
    var title: String
    var infoSlot: String
    var body: some View {
        VStack{
            Text(title)
            Text(infoSlot)
        }.padding()
    }
}
