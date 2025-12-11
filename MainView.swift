//
//  SwiftUIView.swift
//  InscryptionMJ
//
//  Created by MYKHAILO NAUMOV on 12/10/25.
//

import SwiftUI

struct MainView: View {
    @State var wPCT = 0.0
    var body: some View {
        VStack{
            Text("Match the goobers")
                .font(.largeTitle)
            Text("Win percent: \(wPCT, specifier: "%.1f")%")
        }
    }
}

#Preview {
    MainView()
}
