import Foundation
import SwiftUI

struct HomeScreen: View{
    
    @EnvironmentObject var homeScreen: HomeScreenViewModel
    
    var body: some View {
        NavigationView {
            ScrollView{
                if !homeScreen.searchText.isEmpty{
                    VStack {
                        List(homeScreen.searchedResultList, id: \.id){ foodItem in
                            Text("foodItem.title")
                        }
                        Button("temp search") {
                            homeScreen.fetchSearchedFood(searched: homeScreen.searchText)
                        }
    
                    }
    
                }else{
                        RecipeList()
                }
            }
            .navigationTitle("Chefspert")
        }
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
            Text(foodItem.title)
//            NavigationLink {
//
//                //RecipeView()
//            } label: {
//                HStack{
//                    AsyncImage(url: URL(string:foodItem.image)){ image in image
//                            .resizable()
//                            .modifier(RecipeSearchImageModifier())
//
//                    } placeholder: { Image(systemName: "photo")
//                            .modifier(PlacerHolderImageModifier())
//                    }
//
//                    Text(foodItem.title)
//                    Spacer()
//                }
//            }
        }
    }
}
