//
//  Pet.swift
//  PawFred
//
//  Created by Joana Levtcheva on 06/09/2024.
//

import Foundation
import SwiftUI

// MARK: - Pet Model
struct Pet: Identifiable, Codable {
    var id = UUID()
    var name: String
    var breed: String
    var age: Int
    var weight: Double?
    var photo: Data?  // To store the pet's photo as binary data
}
