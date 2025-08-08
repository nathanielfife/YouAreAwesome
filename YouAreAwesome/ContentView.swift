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
    @State private var messages = ["Never let go of the goodness!" , "You Are Awesome!" , "Don't forget that your amazing!", "Good job!" , "There is always a reason to smile!", "You are a child of God!" , "You are terrific!", "Don't worry, America has got your back!" , "How cool are you? SO COOL!", "You Are Great!"]
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
                .multilineTextAlignment(.center)
            Spacer()
            
            Button("Show Message") {
                
                message = messages[(imageNumber)]
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

