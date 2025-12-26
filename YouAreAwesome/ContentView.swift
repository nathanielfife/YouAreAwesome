//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Travis Fife on 7/24/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastImageNumber : Int = -1
    @State private var lastMessageNumber : Int = -1 // last messageNuber will never be -1
    @State private var lastSoundNumber : Int = -1
    @State private var audioPlayer: AVAudioPlayer!
    @State private var soundIsOn = true
    let numberOfSounds = 5
    let numberOfImages = 10 // images labed image0 - image9
    
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
            
            Spacer()
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .shadow(radius: 50)
                .animation(.default, value: imageName)
            
            
            Spacer()
            
            HStack {
                Text("Sound On:")
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) {
                        if audioPlayer != nil {
                            if audioPlayer.isPlaying {
                                audioPlayer.stop()
                            }
                        }
                        
                        
                    }
                
                Spacer()
                
                Button("Show Message") {
                    let messageList = ["Never let go of the goodness!" , "Adda Boy!", "You Are Awesome!" , "Don't forget that your amazing!", "Good job!" , "There is always a reason to smile!", "You are a child of God!" , "You are terrific!"]
                    
                    lastMessageNumber = (nonRepeatingRandom(lastNumber: lastMessageNumber, upperBonds: messageList.count))
                    message = messageList[lastMessageNumber]
                    
                    lastImageNumber = (nonRepeatingRandom(lastNumber: lastImageNumber, upperBonds: numberOfImages))
                    imageName = "image\(lastImageNumber)"
                    
                    lastSoundNumber = (nonRepeatingRandom(lastNumber: lastSoundNumber, upperBonds: numberOfSounds))
                    if soundIsOn {
                        if soundIsOn {
                            playSound(soundName: "sound\(lastSoundNumber)")
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
            }
        }
        .padding()
        
    }
    
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Could not read file named \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR \(error.localizedDescription) creating audioPlayer")
        }
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperBonds: Int) -> Int {
        var number : Int
        repeat {
            number = Int.random(in: 0...(upperBonds-1))
        } while number == lastNumber
        return number
    }
}

#Preview {
    ContentView()
}


