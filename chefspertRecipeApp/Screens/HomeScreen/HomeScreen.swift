import Foundation
import SwiftUI

struct HomeScreen: View{

    @EnvironmentObject var homeScreen: HomeScreenViewModel
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(alignment: .leading){
                    
                    
                    Button("temp search") {
                        homeScreen.fetchSearchedFood(searched: homeScreen.searchText)
                    }
                  //  filterList()
                    
                    HeadingView(title: "A pick from your Favorites...")
                    favoriteCardView()
                    HeadingView(title: "Popular Meals")
                    GridOfItems()
                    HeadingView(title: "Pescaterian Friendly")
                    GridOfItems()
                }.navigationTitle("Chefspert")
                    .searchable(text: $homeScreen.searchText)
                    
                 
               }
            }
        }
      
        
    }
    //MARK: Preview
    struct HomeScreen_Previews: PreviewProvider {
        static var previews: some View {
            HomeScreen()
                .environmentObject(HomeScreenViewModel())
        }
    }
    
    

//MARK: filterList
struct filterList: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(0..<4) {_ in
                    Text("filter")
                        .padding()
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .background(CustomColors.logoBlueColor)
                        .clipShape(Capsule())
                        .padding(.leading, 6)
                }
            }
        }
    }
}
//MARK: Headers
struct HeadingView: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.title2)
            .bold()
            .padding(.leading,15)
    }
}
//MARK: Headers
struct favoriteCardView: View {

    var body: some View {
        NavigationLink(destination: DetailMealScreen()){
            ZStack{
                Rectangle()
                    .foregroundColor(.white)
                
                HStack{
                    Image("stockMeal")
                        .resizable()
                        .frame(width: 90, height: 90)
                    VStack{
                        
                        Text("Served Salmon")
                            .font(.title3)
                            .bold()
                        Text("Pescaterian Friendly")
                            .foregroundColor(.blue)
                            .font(.subheadline)
                    }
                    Spacer()
                    Image(systemName: "heart.circle")
                        .foregroundColor(.pink)
                }
                .padding()
                
            }
            .frame(height: 150)
            .cornerRadius(13)
            .shadow(radius: 3)
            .padding()
        }
    }
}


struct GridOfItems: View {
   
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 5) {
                ForEach(0..<10) {_ in
                    
                    VStack{
                    Image("stockMeal")
                            .resizable()
                            .frame(width: 100, height: 100)
                
                        HStack{
                            Text("Served Salmon")
                                .font(.title3)
                                .bold()
                            Image(systemName: "heart")
                                .foregroundColor(.pink)
                        }

                    Text("Pescaterian Friendly")
                        .foregroundColor(.blue)
                        .font(.subheadline)
                        }
                       
                }
                .frame(width: 250, height: 200)
                .background(.white)
                .cornerRadius(15)
                .padding()
                .shadow(radius: 3)
            }
        }
    }
}
extension UIApplication {
      func dismissKeyboard() {
          sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
      }
  }
 

struct DismissalButton: View {
    @Binding var searchText: String
    @Binding var searching: Bool
    var body: some View {
        Button("Cancel") {
                searchText = ""
                withAnimation {
                    searching = false
                    UIApplication.shared.dismissKeyboard()
                }
           
        }
    }
}
