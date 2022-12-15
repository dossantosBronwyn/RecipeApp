import Foundation
import SwiftUI
struct RecipeStepScreen: View{
    var body: some View {
        NavigationView {
            Text("Steps to take are displayed here")
        }
        .navigationTitle("Recipe Steps")
        
    }
}
    //MARK: Preview
    struct RecipeStepScreen_Previews: PreviewProvider {
        static var previews: some View {
            RecipeStepScreen()
        }
    }
