//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Travis Fife on 7/24/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var image = ""
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            Spacer()
            
            Button("Press Me!") {
                let message1 = "You are Awesome!"
                let message2 = "You are Great!"
                let imageString1 = "sun.max.fill"
                let imageString2 = "hand.thumbsup"
                
                if image == imageString2 {
                    image = imageString1
                    message = message1
                } else {
                    image = imageString2
                    message = message2
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
            
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}

