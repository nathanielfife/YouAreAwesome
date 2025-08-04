//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Travis Fife on 7/24/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .shadow(radius: 50)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            Spacer()
            
            Button("Press Me!") {
                let message0 = "You are Awesome!"
                let message1 = "You are Great!"
                
                imageName = (imageName == "image0" ? "image1" : "image0")
                message = (message == message0 ? message1 : message0)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}

