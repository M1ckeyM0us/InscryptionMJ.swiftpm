//
//  SwiftUIView.swift
//  InscryptionMJ
//
//  Created by JAMES SCHRAUT on 12/10/25.
//

import SwiftUI

struct CardView: View {
    @State var card: Card
    var body: some View {
        Button {
            card.isFaceUp = true
        } label: {
            ZStack{
                Rectangle()
                    .frame(width: 100,height: 200)
                Image("cardBack")
                    .resizable()
                    .frame(width: 80, height: 160)
            }
        }

    }
}

#Preview {
    
}
