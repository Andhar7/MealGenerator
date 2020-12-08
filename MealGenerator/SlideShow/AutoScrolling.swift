//
//  AutoScrolling.swift
//  MealGenerator
//
//  Created by Andrej Kling on 22.11.20.
//

import SwiftUI

struct AutoScrolling: View {
    //MARK: - PROPERTIES
    private var numberOfImages = 8
    private var timer = Timer.publish(every: 2 , on: .main, in: .common).autoconnect()
    @State private var currentIndex = 0
    
    //MARK: - BODY
    var body: some View {
        
        GeometryReader { proxy in
            VStack {
                TabView(selection: $currentIndex) {
                    ForEach(0..<numberOfImages) { num in
                        Image("\(num)")
                            .resizable()
                            .scaledToFit()
                            .overlay(Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)).opacity(0.4))
                            .tag(num)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .clipShape(RoundedRectangle(cornerRadius: 5))
                //.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .padding()
                .frame(width: proxy.size.width, height: proxy.size.height / 3)
                .blur(radius: 0.2)
                .onReceive(timer, perform: { _ in
                    // set the page to be the next image...
                            withAnimation{
                                currentIndex = currentIndex < numberOfImages ? currentIndex + 1 : 0
                            }
                })
            }
        }
    }
}

struct AutoScrolling_Previews: PreviewProvider {
    static var previews: some View {
        AutoScrolling()
    }
}
