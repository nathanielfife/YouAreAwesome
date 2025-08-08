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
    @State private var imageNumber = 0
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
            
            Button("Show Message") {
                let message1 = "You are Awesome!"
                let message2 = "You are Great!"
                let message3 = "Fabulaous? That's You!"
                
                if message == message1 {
                    message = message2
                } else if message == message2 {
                    message = message3
                } else {
                    message = message1
                }
                
                imageName = "image\(imageNumber)"
                imageNumber += 1
                
                if imageNumber > 9 {
                    imageNumber = 0
                }
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

