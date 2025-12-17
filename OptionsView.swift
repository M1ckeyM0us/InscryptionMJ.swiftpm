//
//  SwiftUIView.swift
//  InscryptionMJ
//
//  Created by MYKHAILO NAUMOV on 12/11/25.
//

import SwiftUI

struct OptionsView: View {
    
    @EnvironmentObject var settings: GameSettings
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 25) {
                
                Text("Options View")
                    .font(.largeTitle)
                    .padding(.bottom, 10)
                
                //difficulties
                VStack {
                    Text("Difficulty")
                        .font(.headline)
                    
                    //The Slider lets the user pick a value from 0 to 2 (steps of 1)
                    //The Binding converts:
                    //settings.difficulty Int to Double
                    //slider value Double to Int
                    Slider(value: Binding(
                        get: { Double(settings.difficulty) },
                        set: { settings.difficulty = Int($0) }
                    ), in: 0...3, step: 1)
                    
                    Text(
                        settings.difficulty == 0 ? "Easy":
                            settings.difficulty == 1 ? "Medium":
                        settings.difficulty == 2 ? "Hard" : "silly"
                    )
                    .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                //animations
                Toggle("Enable Flip Animations", isOn: $settings.animationsEnabled)
                    .padding(.horizontal)
                
                Spacer()
            }
            .padding(.top)
        }
    }
}
