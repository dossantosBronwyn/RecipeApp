import Foundation
import SwiftUI


struct DetailMealScreen: View{
    var body: some View {
        ScrollView{
           
                VStack{
                    Image("stockMeal")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding()
                    
                    HStack{
                        Text("Served Salmon")
                            .font(.title.bold())
                            .padding(.trailing, 15)
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 20 ,height: 20)
                            .foregroundColor(.pink)
                    }
                    
                    Text("Pescaterian friendly")
                        .foregroundColor(.blue)
                    Divider()
                        .frame(width: 250)
                    HStack{
                        VStack{
                            Image(systemName: "leaf.fill")
                                .foregroundColor(.green)
                                .padding()
                            Text("Health ")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        Rectangle()
                            .frame(width: 2,height: 80)
                            .cornerRadius(5)
                            .foregroundColor(.gray)
                            .opacity(0.5)
                        VStack{
                            Text("45 Mins")
                                .foregroundColor(.gray)
                                .padding()
                            Text("Prep time")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        Rectangle()
                            .frame(width: 2,height: 80)
                            .cornerRadius(5)
                            .foregroundColor(.gray)
                            .opacity(0.5)
                        VStack{
                            Image(systemName: "star.fill")
                                .padding()
                                .foregroundColor(.yellow)
                            Text("Popularity")
                                .foregroundColor(.gray)
                        }
                        .padding(.leading, 15)
                    }
                    
                    HStack{
                        VStack{
                            Image(systemName: "fork.knife.circle.fill")
                                .resizable()
                                .frame(width: 32,height: 32)
                                .foregroundColor(.gray)
                            Text("Main Course")
                            
                        }
                        .padding()
                        VStack{
                            Image(systemName: "person.2.circle.fill")
                                .resizable()
                                .frame(width: 32,height: 32)
                                .foregroundColor(.gray)
                            Text("Serving Size: 4")
                            
                        }
                        
                    }
                    .padding(.horizontal, 20)
                    
                    //recipe steps block
                    
                    NavigationLink(destination: RecipeStepScreen()){
                        ZStack{
                            Rectangle()
                                .foregroundColor(.white)
                            
                            VStack(){
                            Image(systemName: "carrot")
                           Text("Recipe Steps")
                                    .foregroundColor(.black)
                                    .font(.title3.bold())
                                    
                                Divider()
                                    .frame(width: 200)
                                 

                                Text("tap here to view steps")
                                    .font(.subheadline)
                            }
                          
                            
                        }
                        .frame(height: 150)
                        .cornerRadius(13)
                        .shadow(radius: 3)
                        .padding()
                    }
                    
                   
                    
                    
                    //similar recipe
                    
                    VStack(alignment: .leading){
                        Text("Similar Recipes")
                            .font(.title3.bold())
                            .padding(.leading,20)
                        
                        //similar recipe view
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
                                .cornerRadius(50)
                                .padding()
                                .shadow(radius: 3)
                            }
                        }
                    }
                }
                
            }
            
        }
    }

    //MARK: Preview
    struct DetailMealScreen_Previews: PreviewProvider {
        static var previews: some View {
            DetailMealScreen()
        }
    }
