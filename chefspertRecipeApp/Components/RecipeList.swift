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
            RecipeTitleView(headingText: "Try Something New")
            RecipeCountTitleView(recipeList: $homeScreen.allRecipeResultList)
            RecipeGridView(recipeList: $homeScreen.allRecipeResultList)
            
            //MARK:- Vegeterian Recipes
            RecipeTitleView(headingText: "Vegeterian Friendly")
            RecipeCountTitleView(recipeList: $homeScreen.vegeterianRecipes)
            RecipeGridView(recipeList: $homeScreen.vegeterianRecipes)
            
            //MARK:- Pesceterian Recipes
            RecipeTitleView(headingText: "Pescetarian Picks")
            RecipeCountTitleView(recipeList: $homeScreen.pescetarianRecipes)
            RecipeGridView(recipeList: $homeScreen.pescetarianRecipes)
            
        }
        .onAppear(){
           // homeScreen.fetchAllRecipes()
            // homeScreen.fetchDietSpecificRecipes()
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
    @Binding var recipeList: [Result]
    var body: some View {
        HStack{
            Text("\(recipeList.count) \(recipeList.count > 1 ? "Recipes" : "Recipe") ")
                .modifier(RecipeCountTitleModifier())
            Spacer()
        }
    }
}

struct RecipeGridView: View {
    
    @Binding var recipeList: [Result]
    var body: some View {
        VStack{
            ScrollView(.horizontal){
                HStack(spacing: 15){
                    
                    ForEach(recipeList, id: \.self) { recipes in
                        //                    NavigationLink(destination: RecipeView(recipe: recipes, recipeInfo: recipes)) {
                        RecipeCard( recipeResult: recipes)
                        //                    }
                        
                        
                    }
                }
            }
            .padding(.top)
        }
    }
}
