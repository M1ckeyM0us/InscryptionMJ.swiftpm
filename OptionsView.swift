//
//  SwiftUIView.swift
//  InscryptionMJ
//
//  Created by MYKHAILO NAUMOV on 12/11/25.
//

import SwiftUI

struct OptionsView: View {
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 10) {
                
                Text("Options")
                    .font(.largeTitle.bold())
                
                Text("Settings will go here later.")
                    .foregroundColor(.gray)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
    }
}
