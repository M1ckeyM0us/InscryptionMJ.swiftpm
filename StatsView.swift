//
//  SwiftUIView.swift
//  InscryptionMJ
//
//  Created by JAMES SCHRAUT on 12/11/25.
//

import SwiftUI
import SwiftData

struct StatsView: View {
    
    /*@Query var games: [Game]
    
    
    var triesList: [Int] {
        games.map { $0.tries }
    }

    
    var totalGames: Int {
        games.count
    }

    
    var averageTries: Double {
        if triesList.isEmpty { return 0 }
        return Double(triesList.reduce(0, +)) / Double(triesList.count)
    }

    
    var lowestTries: Int {
        triesList.min() ?? 0
    }

    
    var highestTries: Int {
        triesList.max() ?? 0
    }*/

    var body: some View {
        /*NavigationStack {
            ScrollView {
                VStack(spacing: 25) {

                    statCard(
                        title: "Total Games",
                        bigValue: "\(totalGames)"
                    )

                    statCard(
                        title: "Average Tries",
                        bigValue: String(format: "%.1f", averageTries),
                        minValue: "Lowest: \(lowestTries)",
                        maxValue: "Highest: \(highestTries)"
                    )
                }
                .padding()
            }
            .navigationTitle("Stats")
        }
    }

    
    func statCard(title: String, bigValue: String, minValue: String? = nil, maxValue: String? = nil) -> some View {

        VStack(spacing: 8) {

            Text(title)
                .font(.headline)

            Text(bigValue)
                .font(.title2.bold())

            if let min = minValue {
                Text(min)
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            if let max = maxValue {
                Text(max)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.white)
        .cornerRadius(16)
        .shadow(radius: 3)
         */
    }
}
