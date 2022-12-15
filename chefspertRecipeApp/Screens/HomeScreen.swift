import Foundation
import SwiftUI

struct HomeScreen: View{
    @State var searchText: String = ""
    @State var searching = false
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(alignment: .leading){
                    
                    HStack{
                        SearchBar(searchText: $searchText, searching: $searching, placeHolderText: "Search for a Recipe...")
                    //    DismissalButton(searchText: $searchText, searching: $searching)
                            .padding()
                    }
                    
                  //  filterList()
                    
                    HeadingView(title: "A pick from your Favorites...")
                    favoriteCardView()
                    HeadingView(title: "Popular Meals")
                    GridOfItems()
                    HeadingView(title: "Pescaterian Friendly")
                    GridOfItems()
                }.navigationTitle("Chefspert")
                 
               }
            }
        }
      
        
    }
    //MARK: Preview
    struct HomeScreen_Previews: PreviewProvider {
        static var previews: some View {
            HomeScreen()
        }
    }
    
    //MARK: SearchBar
    struct SearchBar: View {
        @Binding var searchText: String
        @Binding var searching: Bool
        var placeHolderText: String
        
        var body: some View {
            HStack{
                ZStack{
                    
                    Rectangle()
                        .foregroundColor(.white)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                        TextField(placeHolderText, text: $searchText) { startedEditing in
                            if startedEditing {
                                withAnimation {
                                    searching = true
                                }
                            }
                        } onCommit: {
                            withAnimation {
                                searching = false
                            }
                        }
                    }
                    .foregroundColor(.gray)
                    .padding(.leading, 13)
                }
                .frame(height: 40)
                .cornerRadius(13)
                .shadow(radius: 3)
                .padding()
            }
         
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
