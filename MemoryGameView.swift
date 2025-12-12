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
    
    var body: some View {
        VStack {
            Text("Memory Game")
                .font(.largeTitle)
                .padding(.bottom, 10)
            
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
                                .fill(card.isFaceUp || card.isMatched ? Color.white : Color.blue)
                                .frame(height: 120)
                                .shadow(radius: 3)
                                .animation(settings.animationsEnabled ? .easeInOut(duration: 0.25) : .none, value: card.isFaceUp)
                            
                            if card.isFaceUp || card.isMatched {
                                Text(card.emoji)
                                    .font(.largeTitle)
                            }
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
            
            Button("Restart") {
                startGame()
            }
            .padding(.top, 16)
        }
        .onAppear {
            startGame()
        }
        
    }//end of body view
    
    func startGame() {
        let easy = ["🐶", "🐱"]
        let medium = ["🐶", "🐱", "🐸", "🐵"]
        let hard = ["🐶", "🐱", "🐸", "🐵", "🐰", "🐼"]
        
        let chosen: [String]
        
        switch settings.difficulty {
        case 0: chosen = easy
        case 1: chosen = medium
        default: chosen = hard
        }
        
        cards = (chosen + chosen).shuffled().map { Card(emoji: $0) }
        
        indexOfFirstFlipped = nil
        
    }//end of startgame
    
    
    func handleTap(_ index: Int) {
        if cards[index].isMatched || cards[index].isFaceUp { return }
        
        cards[index].isFaceUp = true
        
        if let first = indexOfFirstFlipped {
            checkMatch(first, index)
            indexOfFirstFlipped = nil
        } else {
            indexOfFirstFlipped = index
        }
        
    }// end of handletap
    
    
    func checkMatch(_ first: Int, _ second: Int) {
        if cards[first].emoji == cards[second].emoji {
            cards[first].isMatched = true
            cards[second].isMatched = true
        }
        
        else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                if !settings.animationsEnabled {
                    cards[first].isFaceUp = false
                    cards[second].isFaceUp = false
                }
                
                else {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        cards[first].isFaceUp = false
                        cards[second].isFaceUp = false
                    }
                }
            }
            
        }
        
    }//end of checkmatch
    
}//end of mem view
