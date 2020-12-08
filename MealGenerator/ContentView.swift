//
//  ContentView.swift
//  MealGenerator
//
//  Created by Andrej Kling on 15.11.20.
//

import SwiftUI
import Combine

struct ContentView: View {
    //MARK: - PROPERTIES
    
    @StateObject private var mealGenerator = MealGenerator()
    var actionButton:  some View{
        Button("Get Random Meal") {
            mealGenerator.fetchRandomMeal()
        }
        .font(.title)
        .foregroundColor(.white)
        .background(Color.blue)
        .cornerRadius(15)
        .padding()
        .onAppear{
            mealGenerator.fetchRandomMeal()
        }
    }
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    actionButton
                    if let name = mealGenerator.currentMeal?.name{
                        Text(name)
                            .font(.largeTitle)
                    }
                    AsyncImageView(urlString: $mealGenerator.currentImageURLString)
                    
                    if let ingredients = mealGenerator.currentMeal?.ingredients{
                        HStack{
                            Text("Ingredients")
                                .font(.title)
                            Spacer()
                        }
                        .padding()
                        ForEach(ingredients, id:\.self) { ingredient in
                            
                            HStack {
                                Text(ingredient.name + " - " + ingredient.measure)
                                Spacer()
                            }
                            .padding(.vertical, 5)
                            
                        }
                    }
                    if let instructions = mealGenerator.currentMeal?.instructions{
                        HStack {
                            Text("Instructions")
                                .font(.title)
                        }
                        Text(instructions)
                        Spacer()
                    }
                }
                .foregroundColor(.white)
                .padding()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
