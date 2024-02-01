//
//  gameveiw.swift
//  testmc3
//
//  Created by Reem Alhalafi on 16/07/1445 AH.
//

import SwiftUI

struct adminage: View {
    let players: [String] = ["player", "player", "player", "player", "player"]
    @State private var gameCode = "YourGameCode" // Replace with your actual game code
    @State private var isCopiedMessageVisible = false

    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            VStack {
                if players.isEmpty {
                    Text("مافي احد ")
                } else {
                    List {
                        ForEach(players.indices, id: \.self) { index in
                            HStack {
                                Text("\(index + 1). \(players[index])")
                                    .padding(.vertical, 20)
                                    .foregroundColor(.primary)
                                    .background(Color.white)
                                    .cornerRadius(4)
                                    .padding(.horizontal, 160)
                            }
                            .listRowInsets(EdgeInsets())
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                                    .stroke(Color(.strokeCo))
                            )
                        }
                    }
                    .listStyle(PlainListStyle())
                }

                Text("اعزم ناس خل تبدأ اللعبة")

                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .frame(width: 320, height: 76)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color(red: 255/255, green: 217/255, blue: 77/255), lineWidth: 2)
                        )
                        .fixedSize()

                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(Color(red: 255/255, green: 217/255, blue: 77/255))
                        .frame(width: 320, height: 36)
                        .padding(.top, -37)

                    Text("رمز اللعبة")
                        .padding(.top, -33)

                    Button(action: {
                        copyGameCodeToClipboard()
                    }) {
                        Image("copy")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.gray)
                    }
                    .padding([.leading, .bottom], -140)
                }

                Button("ابدأ اللعبة") {
                    // Add your code to start the game
                }
                .frame(width: 340, height: 55)
                .bold()
                .fixedSize()
                .foregroundColor(.white)
                .background(Color.button)
                .cornerRadius(15)
            }
            .overlay(
                CopiedMessage(message: "تم يلا ارسله", isVisible: $isCopiedMessageVisible)
            )
        }
    }

    private func copyGameCodeToClipboard() {
        UIPasteboard.general.string = gameCode
        isCopiedMessageVisible = true

        // Hide the message after a delay (adjust the duration as needed)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isCopiedMessageVisible = false
        }
    }
}

struct adminage_Previews: PreviewProvider {
    static var previews: some View {
        adminage()
    }
}

struct CopiedMessage: View {
    let message: String
    @Binding var isVisible: Bool

    var body: some View {
        VStack {
            Spacer()
            if isVisible {
                Text(message)
                    .foregroundColor(.button)
                    .padding()
                    .background(Color.yeeee)
                    .cornerRadius(10)
                    .transition(.move(edge: .bottom))
                    .animation(.default)
            }
        }
    }
}


