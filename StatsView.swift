//
//  SwiftUIView.swift
//  InscryptionMJ
//
//  Created by JAMES SCHRAUT on 12/11/25.
//

import SwiftUI

struct StatsView: View {
    
    // persistence
    @AppStorage("gamesPlayed") var gamesPlayed = 0
    @AppStorage("totalTries") var totalTries = 0
    @AppStorage("lowestTries") var lowestTries = 0
    @AppStorage("highestTries") var highestTries = 0

    // average
    var averageTries: Double {
        
        if gamesPlayed == 0 {
            return 0
        }
        return Double(totalTries) / Double(gamesPlayed)
        
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 25) {

                    // total games
                    statCardCentered(
                        title: "Games Played",
                        bigValue: "\(gamesPlayed)"
                    )

                    // average tries
                    statCardCentered(
                        title: "Average Tries",
                        bigValue: String(format: "%.1f", averageTries),
                        minValue: "\(lowestTries)",
                        maxValue: "\(highestTries)"
                    )

                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Game Stats")
        }
    }

    // card
    func statCardCentered(
        title: String,
        bigValue: String,
        minValue: String? = nil,
        maxValue: String? = nil
    ) -> some View {

        VStack(spacing: 8) {

            Text(title)
                .font(.headline)

            Text(bigValue)
                .font(.title2.bold())

            if let minValue = minValue {
                
                Text("Lowest: \(minValue)")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }

            if let maxValue = maxValue {
                
                Text("Highest: \(maxValue)")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.white)
        .cornerRadius(16)
        .shadow(radius: 3)
    }
}
