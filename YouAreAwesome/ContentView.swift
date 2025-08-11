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
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .frame(height: 120)
                .minimumScaleFactor(0.5)
                .animation(.easeInOut(duration: 0.10), value: message)
            
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .shadow(radius: 50)
                .animation(.default, value: imageName)
            
         
            Spacer()
            
            Button("Show Message") {
                let messageList = ["Never let go of the goodness!" , "Adda Boy!", "You Are Awesome!" , "Don't forget that your amazing!", "Good job!" , "There is always a reason to smile!", "You are a child of God!" , "You are terrific!"]
                message = messageList[Int.random(in: 0...messageList.count - 1)]
                imageName = "image\(Int.random(in: 0...9))"
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

