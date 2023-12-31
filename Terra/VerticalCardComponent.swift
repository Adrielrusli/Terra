//
//  VerticalCardComponent.swift
//  Terra
//
//  Created by Adriel Bernard Rusli on 07/10/23.
//

import SwiftUI

struct VerticalCardComponent: View {
    
    var beachInformation: BeachCard
    
    var body: some View {
        
        ZStack(alignment: .leading){
            
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.white)
                
            HStack{
                VStack(alignment: .leading){
                    Spacer()
                    Text(beachInformation.city)
                        .font(.subheadline)
                    Text(beachInformation.beachName)
                        .font(.title2)
                        .padding(.bottom , 20)
                }.padding(.leading, 20)
                Spacer()
                VStack(alignment: .center){
                    Spacer()
                    Text(String(beachInformation.isqa))
                        .font(.system(size: 50))
                        
                    
                    Text(TextViewModel(isqa: beachInformation.isqa).getStatus())
                        .font(.headline)
                        .foregroundColor(TextViewModel(isqa: beachInformation.isqa).getStatusColor())
                        
                    Spacer()
                 
                }/*.padding(.trailing, 20)*/
                .offset(x: -20)
                
            }
            
        }.frame(width: UIScreen.main.bounds.width * 0.92 , height: UIScreen.main.bounds.height * 0.14)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .gesture(
                DragGesture(minimumDistance: 50)
                    .onEnded{ gesture in
                        if gesture.translation.width > 0 {
                            BeachCardViewModel.shared.saveBeachCard(beachInformation)
                        }else {
                            
                        }
                        
                    }
            )
//            .onLongPressGesture{
//                BeachCardViewModel.shared.saveBeachCard(beachInformation)
//            }

        
        
        
        
    }
    }


//#Preview {
//    VerticalCardComponent(beachInformation: BeachCard(id: UUID(), isqa: 80, beachName: "Ancol", city: "Jakarta", temperature: 26, uv: 7, windSpeed: 9))
//}
