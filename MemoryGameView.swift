//
//  SwiftUIView.swift
//  InscryptionMJ
//
//  Created by MYKHAILO NAUMOV on 12/10/25.
//

import SwiftUI

struct MemoryGameView: View {
    
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
                    columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 12) {
                        
                    ForEach(cards.indices, id: \.self) { index in
                        
                        let card = cards[index]
                        
                        Button {
                            handleTap(index)
                        }
                        label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(card.isFaceUp || card.isMatched ? Color.white : Color.blue)
                                    .frame(height: 120)
                                    .shadow(radius: 3)
                                Image("Diego")
                                    .resizable()
                                    .frame(width: 120, height: 100)
                                if card.isFaceUp || card.isMatched {
                                    
                                    Text(card.emoji)
                                        .font(.largeTitle)
                                    
                                }
                                
                            }
                        }
                        .buttonStyle(.plain)
}//foreach
                }//grid
                .padding()
                
                Button("Restart") {
                    startGame()
                }
                .padding(.top, 16)
            }
        }//scrollview
        .onAppear {
            startGame()
        }
        
    }//end of body view
    
    func startGame() {
        
        let easy = ["🥶", "🎄"]
        let medium = ["🥶", "🎄", "🎅", "❄️"]
        let hard = ["🥶", "🎄", "🎅", "❄️", "☃️", "🧊"]
        let fun = ["🦼", "🥶", "🎄", "🎅", "❄️", "☃️", "🧊","🔼","▶️","↖️","🎦","ℹ️","⏺️","➡️","🔄","⏹️","*️⃣","🌕","🐒","🐗","🗻"]
        let chosen: [String]
        
        switch settings.difficulty {
            
        case 0: chosen = easy
        case 1: chosen = medium
        case 2: chosen = hard
        default: chosen = fun
            
        }
        
        cards = (chosen + chosen).shuffled().map { Card(emoji: $0) }
        indexOfFirstFlipped = nil
        tries = 0
        
    }//end of startgame
    
    func handleTap(_ index: Int) {
        
        if cards[index].isMatched || cards[index].isFaceUp {
            return
        }
        
        cards[index].isFaceUp = true
        
        if let first = indexOfFirstFlipped {
            
            tries += 1
            checkMatch(first, index)
            indexOfFirstFlipped = nil
            
        }
        
        else {
            indexOfFirstFlipped = index
        }
        
    }// end of handletap
    
    func checkMatch(_ first: Int, _ second: Int) {
        if cards[first].emoji == cards[second].emoji {
            
            cards[first].isMatched = true
            cards[second].isMatched = true
            
            if cards.allSatisfy({ $0.isMatched }) {
                
                saveStats()
                
            }
        }
        
        else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                if settings.animationsEnabled {
                    withAnimation {
                        
                        cards[first].isFaceUp = false
                        cards[second].isFaceUp = false
                        
                    }
                }
                
                else {
                    
                    cards[first].isFaceUp = false
                    cards[second].isFaceUp = false
                    
                }
            }
        }
        
    }//end of checkmatch
    
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
    
}//end of mem view
