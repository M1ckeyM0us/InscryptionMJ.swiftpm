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
                
                Text("Options")
                    .font(.largeTitle)
                
                //difficulties
                VStack {
                    Text("Difficulty")
                        .font(.headline)
                    
                    Slider(value: Binding(
                        get: { Double(settings.difficulty) },
                        set: { settings.difficulty = Int($0) }
                    ), in: 0...2, step: 1)
                    
                    Text(
                        settings.difficulty == 0 ? "Easy" :
                        settings.difficulty == 1 ? "Medium" : "Hard"
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
