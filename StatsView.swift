//
//  SwiftUIView.swift
//  InscryptionMJ
//
//  Created by JAMES SCHRAUT on 12/11/25.
//

import SwiftUI

struct StatsView: View {

    var body: some View {
        VStack(spacing: 20) {

            Text("Game Stats")
                .font(.largeTitle)
                .padding(.top)

            Text("Games Played: 12")
                .font(.title3)

            Text("Average Tries: 6.2")
                .font(.title3)

            Text("Lowest Tries: 4")
                .font(.title3)

            Text("Highest Tries: 9")
                .font(.title3)

            Spacer()
        }
        .padding()
    }
}
