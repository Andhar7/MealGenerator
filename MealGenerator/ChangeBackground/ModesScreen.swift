//
//  ModesScreen.swift
//  MealGenerator
//
//  Created by Andrej Kling on 22.11.20.
//

import SwiftUI

struct ModesScreen: View {
    //MARK: - PROPERTIES
    @AppStorage("isDarkMode") var isDarkMode = false
    var body: some View {
        VStack {
            Picker("Mode", selection: $isDarkMode) {
                Text("Light")
                    .tag(false)
                Text("Dark")
                    .tag(true)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            Spacer()
            List(0..<5, id: \.self) { num in
                NavigationLink(destination:  Text("\(num)")){
                    Text("\(num)")
                }
            
            }
        }
        .navigationTitle("Mode Switch")
    }
}

struct ModesScreen_Previews: PreviewProvider {
    static var previews: some View {
        ModesScreen()
    }
}
