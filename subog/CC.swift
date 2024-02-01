//
//  ContentView.swift
//  Sabog
//
//  Created by Norah W on 16/07/1445 AH.
//

import SwiftUI
import CloudKit

struct CC: View {
    @State private var randoom_Code: String = ""
    @State private var gameCode = String()
    @State private var isCopedMassegeVisbile = false

    init() {
        self.randoom_Code = randomAlphanumericString()
        self._gameCode = State(initialValue: randoom_Code)
    }

    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    // ... your existing code ...

                    // Your VStack and other views go here

                    Text("gameCode")
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding()
                        .position(x: 200, y: 140)

                    // ... more of your existing code ...

                    Button(action: {
                        // Optionally, you can regenerate the code when the button is tapped
                        // gameCode = GameCodeGenerator.generateGameCode()
                    }) {
                        NavigationLink(destination: ContentView()
                            .navigationBarBackButtonHidden(true)) {
                            Text("يلا بدينا")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
                }
                .position(x: 200, y: 30)
                .padding()
            }
        }
    }

    // Your randomAlphanumericString function
    func randomAlphanumericString() -> String {
        let digit = 4

        let letters = "0123456789"
        let len = UInt32(letters.count)
        var random = SystemRandomNumberGenerator()
        var randomString = ""
        for _ in 0..<digit {
            let randomIndex = Int(random.next(upperBound: len))
            let randomCharacter = letters[letters.index(letters.startIndex, offsetBy: randomIndex)]
            randomString.append(randomCharacter)
        }
        return randomString
    }
}

#Preview {
    CC()
}
