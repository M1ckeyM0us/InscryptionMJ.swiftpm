//
//  File.swift
//  InscryptionMJ
//
//  Created by MYKHAILO NAUMOV on 12/12/25.
//

import Foundation
import SwiftUI

class GameSettings: ObservableObject {

    @Published var difficulty: Int = 1  // 0 = ez 1 = mid 2 = hard
    @Published var animationsEnabled: Bool = true

}
