import SwiftUI

struct RecipeView: View {
    var recipe: Result
    var recipeInfo: RecipeInformationSearch
    
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
                VStack(alignment: .leading, spacing: 30){
                    Text("description")
                    VStack(alignment: .leading, spacing: 20){
                        Text("Ingredients")
                            .font(.headline)
                        Text("ingredients to follow")
                    }
                    VStack(alignment: .leading, spacing: 20){
                        Text("Directions")
                            .font(.headline)
                        Text("Directions to follow")
                    }
                }
                .frame(maxWidth: . infinity, alignment: .leading)
                
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}


//struct RecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeView()
//    }
//}
