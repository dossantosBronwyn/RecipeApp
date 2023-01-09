import Foundation
import SwiftUI

struct HomeScreen: View{
    
    @EnvironmentObject var homeScreen: ViewModel
    
    var body: some View {
            NavigationView {
                
                if !homeScreen.searchText.isEmpty{
                    VStack {
                        RecipeSearchListView()
                        Button("temp search") {
                            homeScreen.fetchSearchedFood(searched: homeScreen.searchText)
                        }
                        
                    }
                    
                }else{
                    ScrollView{
                        RecipeList()
                    }
                }
                   
        }
            .navigationTitle("Chefspert")
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Image(systemName: "star.fill")
                }
            }
        .searchable(text: $homeScreen.searchText)
    }
    
    //MARK: Preview
    struct HomeScreen_Previews: PreviewProvider {
        static var previews: some View {
            HomeScreen()
                .environmentObject(ViewModel())
        }
    }
    
}

struct RecipeSearchListView: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        List(viewModel.searchedResultList, id: \.self){ foodItem in
            NavigationLink {

                RecipeView(recipe: foodItem)
            } label: {
                HStack{
                    AsyncImage(url: URL(string:foodItem.image)){ image in image
                            .resizable()
                            .modifier(RecipeSearchImageModifier())

                    } placeholder: { Image(systemName: "photo")
                            .modifier(PlacerHolderImageModifier())
                    }

                    Text(foodItem.title)
                    Spacer()
                }
            }
        }.scrollContentBackground(.hidden)
    }
}
