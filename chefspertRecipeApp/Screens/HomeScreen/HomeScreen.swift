import Foundation
import SwiftUI

struct HomeScreen: View{
    
    @EnvironmentObject var homeScreen: HomeScreenViewModel
    
    var body: some View {
        NavigationView {
            ScrollView{
                if !homeScreen.searchText.isEmpty{
                    VStack {
                        Button("temp search") {
                            homeScreen.fetchSearchedFood(searched: homeScreen.searchText)
                        }
                        RecipeSearchListView()
                    }
                    .onDisappear(){
                        homeScreen.searchedResultList = []
                    }
                }else{
                        RecipeList()
                }
            }
        }
        .navigationTitle("Chefspert")
        .searchable(text: $homeScreen.searchText)
        
        
        
        
    }
    //MARK: Preview
    struct HomeScreen_Previews: PreviewProvider {
        static var previews: some View {
            HomeScreen()
                .environmentObject(HomeScreenViewModel())
        }
    }
    
}

struct RecipeSearchListView: View {
    @EnvironmentObject var homeScreen: HomeScreenViewModel
    var body: some View {
        List(homeScreen.searchedResultList, id: \.self){ foodItem in
            NavigationLink {
                DetailMealScreen()
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
        }
    }
}
