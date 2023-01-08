//
//  SplashScreen.swift
//  chefspertRecipeApp
//
//  Created by Bronwyn dos Santos on 2023/01/06.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    
    var body: some View {
        if isActive {
            Text("add home view here")
        }else{
            VStack{
                VStack{
                    Image(systemName: "hare.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.blue)
                    Text("Epic App 2")
                        .font(Font.custom("Baskerville-Bold", size: 26))
                        
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear(){
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }.onAppear(){
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    self.isActive = true
                }
        }
      
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
