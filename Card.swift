//
//  File.swift
//  InscryptionMJ
//
//  Created by MYKHAILO NAUMOV on 12/10/25.
//

import SwiftUI

struct Card: Identifiable, Equatable {

    let id = UUID()
    let emoji: String
    var isFaceUp = false
    var isMatched = false

    init(emoji: String, isFaceUp: Bool = false, isMatched: Bool = false) {
        self.emoji = emoji
        self.isFaceUp = isFaceUp
        self.isMatched = isMatched
    }

}
