//
//  ContentView.swift
//  PawFred
//
//  Created by Joana Levtcheva on 17/07/2024.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
            Text("Hi, I am Freddy!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(hue: 0.05, saturation: 0.653, brightness: 0.966))
            Button("Test Button") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
    PetProfileView()
}
