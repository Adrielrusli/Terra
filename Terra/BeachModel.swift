//
//  BeachModel.swift
//  Terra
//
//  Created by Adriel Bernard Rusli on 07/10/23.
//

import SwiftUI
import MapKit

struct BeachCoord: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: Int
}

struct BeachCard: Identifiable, Codable {
    let id: UUID
    let isqa: Int
    let beachName: String
    let city: String
    let temperature: Int
    let uv: Int
    let windSpeed: Int
    
    static func generateDummyData() -> [BeachCard] {
        return [
            BeachCard(id: UUID(), isqa: 84, beachName: "Alameda", city: "California", temperature: 30, uv: 6, windSpeed: 7),
            BeachCard(id: UUID(), isqa: 64, beachName: "Colusa", city: "California", temperature: 31, uv: 7, windSpeed: 8),
            BeachCard(id: UUID(), isqa: 80, beachName: "Contra Costa", city: "California", temperature: 32, uv: 8, windSpeed: 9),
            BeachCard(id: UUID(), isqa: 41, beachName: "Del Norte", city: "California", temperature: 33, uv: 10, windSpeed: 9),
            BeachCard(id: UUID(), isqa: 17, beachName: "Fresno", city: "California", temperature: 33, uv: 10, windSpeed: 9),
            BeachCard(id: UUID(), isqa: 77, beachName: "Humboldt", city: "California", temperature: 33, uv: 10, windSpeed: 9),
            BeachCard(id: UUID(), isqa: 10, beachName: "Los Angeles", city: "California", temperature: 33, uv: 10, windSpeed: 9),
            BeachCard(id: UUID(), isqa: 71, beachName: "Merced", city: "California", temperature: 33, uv: 10, windSpeed: 9),
            BeachCard(id: UUID(), isqa: 84, beachName: "Placer", city: "California", temperature: 33, uv: 10, windSpeed: 9),
            BeachCard(id: UUID(), isqa: 72, beachName: "Sacramento", city: "California", temperature: 33, uv: 10, windSpeed: 9),
            BeachCard(id: UUID(), isqa:71, beachName: "San Joaquin", city: "California", temperature: 33, uv: 10, windSpeed: 9),
            BeachCard(id: UUID(), isqa: 80, beachName: "Siskiyou", city: "California", temperature: 33, uv: 10, windSpeed: 9),
            BeachCard(id: UUID(), isqa: 64, beachName: "Solano", city: "California", temperature: 33, uv: 10, windSpeed: 9),
            BeachCard(id: UUID(), isqa: 13, beachName: "Stanislaus", city: "California", temperature: 33, uv: 10, windSpeed: 9),
            BeachCard(id: UUID(), isqa: 73, beachName: "Sutter", city: "California", temperature: 33, uv: 10, windSpeed: 9),
            BeachCard(id: UUID(), isqa: 64, beachName: "Yolo", city: "California", temperature: 33, uv: 10, windSpeed: 9),
        ]
    }
}

struct CreatureCard: Identifiable, Codable{
    let id: UUID
    let name: String
    let descriptionLookLike: String
    let descriptionLive: String
    let descriptionDangerous : String
    let descriptionAvoid : String
    let descriptionHurt : String
    let dangerousState : Bool
    
    static func generateDummyDataCreature() -> [CreatureCard] {
        return [
            CreatureCard(id: UUID(), name: "Stingray", descriptionLookLike: "They come in a variety of shapes and sizes, but all stingrays have a triangular flat shape body with a tapering tail that is armed with one or more spines. The stingray’s colours commonly reflect the sea floor’s shading, camouflaging it from predators. Their eyes peer out from the top of their body, while their mouth, nostrils, and gill slits are underneath.", descriptionLive: "In very shallow waters all over Indonesia.", descriptionDangerous: "Most stingrays have barbs on their tails that they use for defence. These barbs are venomous. When humans get stabbed, the wound bleeds, swells and is very painful. The venom can cause nausea, vomiting, muscle cramps, diarrhoea, sweating and convulsions.", descriptionAvoid: "Shuffle your feet — this tells them you are coming and gives them time to swim away. Always wear thick-soled shoes when walking through shallow water.", descriptionHurt: "Call emergency number. Put the affected area in hot water (as hot as the victim can stand) and get medical assistance. If the barb is still stuck, don’t remove it.", dangerousState: true),
            CreatureCard(id: UUID(), name: "Stingrays", descriptionLookLike: "They come in a variety of shapes and sizes, but all stingrays have a triangular flat shape body with a tapering tail that is armed with one or more spines. The stingray’s colours commonly reflect the sea floor’s shading, camouflaging it from predators. Their eyes peer out from the top of their body, while their mouth, nostrils, and gill slits are underneath.", descriptionLive: "In very shallow waters all over Indonesia.", descriptionDangerous: "Most stingrays have barbs on their tails that they use for defence. These barbs are venomous. When humans get stabbed, the wound bleeds, swells and is very painful. The venom can cause nausea, vomiting, muscle cramps, diarrhoea, sweating and convulsions.", descriptionAvoid: "Shuffle your feet — this tells them you are coming and gives them time to swim away. Always wear thick-soled shoes when walking through shallow water.", descriptionHurt: "Call emergency number. Put the affected area in hot water (as hot as the victim can stand) and get medical assistance. If the barb is still stuck, don’t remove it.", dangerousState: false),
            CreatureCard(id: UUID(), name: "Stingray2", descriptionLookLike: "They come in a variety of shapes and sizes, but all stingrays have a triangular flat shape body with a tapering tail that is armed with one or more spines. The stingray’s colours commonly reflect the sea floor’s shading, camouflaging it from predators. Their eyes peer out from the top of their body, while their mouth, nostrils, and gill slits are underneath.", descriptionLive: "In very shallow waters all over Indonesia.", descriptionDangerous: "Most stingrays have barbs on their tails that they use for defence. These barbs are venomous. When humans get stabbed, the wound bleeds, swells and is very painful. The venom can cause nausea, vomiting, muscle cramps, diarrhoea, sweating and convulsions.", descriptionAvoid: "Shuffle your feet — this tells them you are coming and gives them time to swim away. Always wear thick-soled shoes when walking through shallow water.", descriptionHurt: "Call emergency number. Put the affected area in hot water (as hot as the victim can stand) and get medical assistance. If the barb is still stuck, don’t remove it.", dangerousState: true),
            CreatureCard(id: UUID(), name: "Stingrays2", descriptionLookLike: "They come in a variety of shapes and sizes, but all stingrays have a triangular flat shape body with a tapering tail that is armed with one or more spines. The stingray’s colours commonly reflect the sea floor’s shading, camouflaging it from predators. Their eyes peer out from the top of their body, while their mouth, nostrils, and gill slits are underneath.", descriptionLive: "In very shallow waters all over Indonesia.", descriptionDangerous: "Most stingrays have barbs on their tails that they use for defence. These barbs are venomous. When humans get stabbed, the wound bleeds, swells and is very painful. The venom can cause nausea, vomiting, muscle cramps, diarrhoea, sweating and convulsions.", descriptionAvoid: "Shuffle your feet — this tells them you are coming and gives them time to swim away. Always wear thick-soled shoes when walking through shallow water.", descriptionHurt: "Call emergency number. Put the affected area in hot water (as hot as the victim can stand) and get medical assistance. If the barb is still stuck, don’t remove it.", dangerousState: false),
            CreatureCard(id: UUID(), name: "Stingray3", descriptionLookLike: "They come in a variety of shapes and sizes, but all stingrays have a triangular flat shape body with a tapering tail that is armed with one or more spines. The stingray’s colours commonly reflect the sea floor’s shading, camouflaging it from predators. Their eyes peer out from the top of their body, while their mouth, nostrils, and gill slits are underneath.", descriptionLive: "In very shallow waters all over Indonesia.", descriptionDangerous: "Most stingrays have barbs on their tails that they use for defence. These barbs are venomous. When humans get stabbed, the wound bleeds, swells and is very painful. The venom can cause nausea, vomiting, muscle cramps, diarrhoea, sweating and convulsions.", descriptionAvoid: "Shuffle your feet — this tells them you are coming and gives them time to swim away. Always wear thick-soled shoes when walking through shallow water.", descriptionHurt: "Call emergency number. Put the affected area in hot water (as hot as the victim can stand) and get medical assistance. If the barb is still stuck, don’t remove it.", dangerousState: true),
            CreatureCard(id: UUID(), name: "Stingrays3", descriptionLookLike: "They come in a variety of shapes and sizes, but all stingrays have a triangular flat shape body with a tapering tail that is armed with one or more spines. The stingray’s colours commonly reflect the sea floor’s shading, camouflaging it from predators. Their eyes peer out from the top of their body, while their mouth, nostrils, and gill slits are underneath.", descriptionLive: "In very shallow waters all over Indonesia.", descriptionDangerous: "Most stingrays have barbs on their tails that they use for defence. These barbs are venomous. When humans get stabbed, the wound bleeds, swells and is very painful. The venom can cause nausea, vomiting, muscle cramps, diarrhoea, sweating and convulsions.", descriptionAvoid: "Shuffle your feet — this tells them you are coming and gives them time to swim away. Always wear thick-soled shoes when walking through shallow water.", descriptionHurt: "Call emergency number. Put the affected area in hot water (as hot as the victim can stand) and get medical assistance. If the barb is still stuck, don’t remove it.", dangerousState: false)
        ]
    }
    
    
}

