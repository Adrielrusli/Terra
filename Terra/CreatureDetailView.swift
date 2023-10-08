//
//  CreatureDetailView.swift
//  Terra
//
//  Created by Adriel Bernard Rusli on 08/10/23.
//

import SwiftUI

struct CreatureDetailView: View {
    var creatureInformation: CreatureCard
    @Binding var shouldOpenCreatureDetail : Bool
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Color("BackgroundColor")
                
                HStack{
                    Button{
                        shouldOpenCreatureDetail = false
                    }label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 28))
                    }
                    Text(creatureInformation.name)
                        .font(.title2)
                    Spacer()
                }.frame(width: geometry.size.width * 0.9)
                    .position(x: geometry.size.width / 2 , y: geometry.size.height * 0.12)
                
                ZStack{
                    
                    Image(creatureInformation.name)
                        .resizable()
                    
                    
                } .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.14)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .position(x: geometry.size.width / 2 , y: geometry.size.height * 0.24)
                
                ScrollView{
                    VStack(alignment: .leading, spacing: 20){
                        VStack(alignment: .leading){
                            Text("What Do They Look like")
                                .font(.headline)
                                .foregroundColor(Color("Blue"))
                            
                            Text(creatureInformation.descriptionLookLike)
                                .padding(.top , 10)
                            
                        }
                        VStack(alignment: .leading){
                            Text("Where Do They Live ? ")
                                .font(.headline)
                                .foregroundColor(Color("Blue"))
                            
                            Text(creatureInformation.descriptionLive)
                                .padding(.top , 10)
                            
                        }
                        
                        VStack(alignment: .leading){
                            Text("Are They Dangerous ? ")
                                .font(.headline)
                                .foregroundColor(Color("Blue"))
                            
                            Text(creatureInformation.descriptionDangerous)
                                .padding(.top , 10)
                            
                        }
                        
                        VStack(alignment: .leading){
                            Text("How To Avoid Them ? ")
                                .font(.headline)
                                .foregroundColor(Color("Blue"))
                            
                            Text(creatureInformation.descriptionAvoid)
                                .padding(.top , 10)
                            
                        }
                        VStack(alignment: .leading){
                            Text("What to Do if You Get Hurt ? ")
                                .font(.headline)
                                .foregroundColor(Color("Blue"))
                            
                            Text(creatureInformation.descriptionHurt)
                                .padding(.top , 10)
                            
                        }
                    }
                }.frame(width: geometry.size.width * 0.88, height: geometry.size.height * 0.55)
                    .position(x: geometry.size.width / 2 , y: geometry.size.height * 0.64)
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    CreatureDetailView(creatureInformation: CreatureCard(id: UUID(), name: "Stingray", descriptionLookLike: "They come in a variety of shapes and sizes, but all stingrays have a triangular flat shape body with a tapering tail that is armed with one or more spines. The stingray’s colours commonly reflect the sea floor’s shading, camouflaging it from predators. Their eyes peer out from the top of their body, while their mouth, nostrils, and gill slits are underneath.", descriptionLive: "In very shallow waters all over Indonesia.", descriptionDangerous: "Most stingrays have barbs on their tails that they use for defence. These barbs are venomous. When humans get stabbed, the wound bleeds, swells and is very painful. The venom can cause nausea, vomiting, muscle cramps, diarrhoea, sweating and convulsions.", descriptionAvoid: "Shuffle your feet — this tells them you are coming and gives them time to swim away. Always wear thick-soled shoes when walking through shallow water.", descriptionHurt: "Call emergency number. Put the affected area in hot water (as hot as the victim can stand) and get medical assistance. If the barb is still stuck, don’t remove it.", dangerousState: true), shouldOpenCreatureDetail: .constant(true))
}
