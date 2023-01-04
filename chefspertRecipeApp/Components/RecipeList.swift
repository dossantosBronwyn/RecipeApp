//
//  RecipeList.swift
//  chefspertRecipeApp
//
//  Created by Bronwyn dos Santos on 2023/01/04.
//

import SwiftUI

struct RecipeList: View {
    @EnvironmentObject var homeScreen: HomeScreenViewModel
    var body: some View {
        
        VStack{
            //MARK:- All Recipes
            RecipeTitleView(headingText: "All Recipes")
            RecipeCountTitleView()
            AllRecipeGridView()
            
            //MARK:- Vegeterian Recipes
            RecipeTitleView(headingText: "Vegeterian Friendly")
            RecipeCountTitleView()
            
            AllRecipeGridView()
            
            //MARK:- Vegeterian Recipes
            RecipeTitleView(headingText: "Popular Picks")
            RecipeCountTitleView()
            
            AllRecipeGridView()
        }
        .onAppear(){
            homeScreen.fetchAllRecipes()
        }
        .padding(.horizontal)
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView{
            RecipeList()
                .environmentObject(HomeScreenViewModel())
        }
    }
}

struct RecipeTitleView: View {
    @EnvironmentObject var homeScreen: HomeScreenViewModel
    let headingText: String
    var body: some View {
        HStack{
            Text(headingText)
                .modifier(HomeScreenTitleModifier())
            
            Spacer()
        }
    }
}

struct RecipeCountTitleView: View {
    @EnvironmentObject var homeScreen: HomeScreenViewModel
    var body: some View {
        HStack{
            Text("\(homeScreen.allRecipeResultList.count) \(homeScreen.allRecipeResultList.count > 1 ? "Recipes" : "Recipe") ")
                .modifier(RecipeCountTitleModifier())
            Spacer()
        }
    }
}

struct AllRecipeGridView: View {
    @EnvironmentObject var homeScreen: HomeScreenViewModel
    var body: some View {
        VStack{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)],spacing: 15) {
                ForEach(homeScreen.allRecipeResultList, id: \.self) { recipes in
                    RecipeCard( recipeResult: recipes)
                    
                }
            }
            .padding(.top)
        }
    }
}
