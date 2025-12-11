//
//  SwiftUIView.swift
//  InscryptionMJ
//
//  Created by JAMES SCHRAUT on 12/11/25.
//

import SwiftUI

struct StatView: View {
    @State var wPCT = 0.0
    @State var gamesPlayed = 0
    @State var lowestFail = 10
        var body: some View {
            VStack{
                Text("Match the goobers stats")
                    .font(.largeTitle)
                Text("Win percent: \(wPCT, specifier: "%.1f")%")
                Text("Games played: \(gamesPlayed)")
                Text("Lowest amount of tries: \(lowestFail)")
            }
        }
    }

