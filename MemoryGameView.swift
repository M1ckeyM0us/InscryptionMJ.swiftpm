//
//  SwiftUIView.swift
//  InscryptionMJ
//
//  Created by MYKHAILO NAUMOV on 12/10/25.
//

import SwiftUI

struct MemoryGameView: View {

    // using settings here
    @EnvironmentObject var settings: GameSettings

    @State private var cards: [Card] = []
    @State private var indexOfFirstFlipped: Int? = nil
    @State private var tries = 0

    // stats persistence
    @AppStorage("gamesPlayed") var gamesPlayed = 0
    @AppStorage("totalTries") var totalTries = 0
    @AppStorage("lowestTries") var lowestTries = 0
    @AppStorage("highestTries") var highestTries = 0

    var body: some View {
        ScrollView {
            VStack {
                Text("Memory Game")
                    .font(.largeTitle)
                    .padding(.bottom, 10)

                Text("Tries: \(tries)")
                    .font(.headline)

                //James helped me out with grid
                LazyVGrid(
                    columns: Array(repeating: GridItem(.flexible()), count: 2),
                    spacing: 12
                ) {

                    ForEach(cards.indices, id: \.self) { index in

                        let card = cards[index]

                        Button {
                            handleTap(index)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(
                                        card.isFaceUp || card.isMatched
                                            ? Color.white : Color.blue
                                    )
                                    .frame(height: 120)
                                    .shadow(radius: 3)
                            
                                if card.isFaceUp || card.isMatched {

                                    Text(card.emoji)
                                        .font(.largeTitle)

                                }

                            }
                        }
                        .buttonStyle(.plain)
                    }  //foreach
                }  //grid
                .padding()

                Button("Restart") {
                    startGame()
                }
                .padding(.top, 16)
            }
        }  //scrollview
        .onAppear {
            startGame()
        }

    }  //end of body view

    func startGame() {

        let easy = ["🥶", "🎄"]
        let medium = ["🥶", "🎄", "🎅", "❄️"]
        let hard = ["🥶", "🎄", "🎅", "❄️", "☃️", "🧊"]
        let fun = ["🥶", "🎄", "🎅", "❄️", "☃️", "🧊", "🧤", "*️⃣", "🗻"]
        let chosen: [String]

        switch settings.difficulty {

        case 0: chosen = easy
        case 1: chosen = medium
        case 2: chosen = hard
        default: chosen = fun

        }

        // creates paired and shuffled cards, then resets the selected card index and the tries counter
        cards = (chosen + chosen).shuffled().map { Card(emoji: $0) }
        indexOfFirstFlipped = nil
        tries = 0

    }  //end of startgame

    //flips a tapped card, ignores already matched or faceup cards and tracks the first flipped card and when a second card is tapped it counts a try and checks if the cards match
    func handleTap(_ index: Int) {

        if cards[index].isMatched || cards[index].isFaceUp {
            return
        }

        cards[index].isFaceUp = true

        if let first = indexOfFirstFlipped {

            tries += 1
            checkMatch(first, index)
            indexOfFirstFlipped = nil

        } else {
            indexOfFirstFlipped = index
        }

    }  // end of handletap

    // checks if two flipped cards match, marks them as matched if they do and saves stats when all cards are matched or flips them back down after a short time if they don’t
    func checkMatch(_ first: Int, _ second: Int) {
        if cards[first].emoji == cards[second].emoji {

            cards[first].isMatched = true
            cards[second].isMatched = true

            if cards.allSatisfy({ $0.isMatched }) {

                saveStats()

            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                if settings.animationsEnabled {
                    withAnimation {

                        cards[first].isFaceUp = false
                        cards[second].isFaceUp = false

                    }
                } else {

                    cards[first].isFaceUp = false
                    cards[second].isFaceUp = false

                }
            }
        }

    }  //end of checkmatch

    // updates the game statistics by increasing games played and other things
    func saveStats() {
        gamesPlayed += 1
        totalTries += tries

        if lowestTries == 0 || tries < lowestTries {

            lowestTries = tries

        }

        if tries > highestTries {

            highestTries = tries

        }
    }

}  //end of mem view
