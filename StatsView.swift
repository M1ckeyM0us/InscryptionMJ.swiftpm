//
//  SwiftUIView.swift
//  InscryptionMJ
//
//  Created by JAMES SCHRAUT on 12/11/25.
//

import SwiftUI
import SwiftData
    
    struct StatsView: View {
        @State var gamesPlayed = 0
        @State var averageTries = 0.0
        @State var lowestTries = 10
        @State var highestTries = 0
        
        var body: some View {
            VStack(spacing: 18) {
                
                // Title
                Text("Game Stats")
                    .font(.largeTitle)
                    .padding(.top)
                
                // Stats
                Text("Games Played: \(gamesPlayed)")
                    .font(.title3)
                
                Text("Average Tries: \(averageTries, specifier: "%.1f")")
                    .font(.title3)
                
                Text("Lowest Tries: \(lowestTries)")
                    .font(.title3)
                
                Text("Highest Tries: \(highestTries)")
                    .font(.title3)
                
                Spacer()
            }
            .padding()
        }
    }
