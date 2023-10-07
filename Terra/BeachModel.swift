//
//  BeachModel.swift
//  Terra
//
//  Created by Adriel Bernard Rusli on 07/10/23.
//

import SwiftUI

struct BeachCard: Identifiable, Codable {
    let id: UUID
    let isqa: Int
    let beachName: String
    let city: String
   
    static func generateDummyData() -> [BeachCard] {
           return [
               BeachCard(id: UUID(), isqa: 60, beachName: "Ancol", city: "Jakarta"),
               BeachCard(id: UUID(), isqa: 30, beachName: "Merak", city: "Banten"),
               BeachCard(id: UUID(), isqa: 80, beachName: "Carita", city: "Banten")
           ]
       }
}

