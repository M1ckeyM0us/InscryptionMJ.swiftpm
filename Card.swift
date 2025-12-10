//
//  File.swift
//  InscryptionMJ
//
//  Created by MYKHAILO NAUMOV on 12/10/25.
//

import SwiftUI

class Card{
    
    
    
    
    let image: String
    var isFaceUp = false
    var isMatched = false
    
    init(image: String, isFaceUp: Bool = false, isMatched: Bool = false) {
        
        self.image = image
        self.isFaceUp = isFaceUp
        self.isMatched = isMatched
        
    }
 
    
    
    
    
    
}
