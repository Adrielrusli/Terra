//
//  HorizontalCardComponent.swift
//  Terra
//
//  Created by Adriel Bernard Rusli on 07/10/23.
//

import SwiftUI

struct HorizontalCardComponent: View {
    
    var beachInformation: BeachCard
    
    
    
    
    var body: some View {
        
        ZStack(alignment: .leading){
            
            RoundedRectangle(cornerRadius: 20)
            
                .foregroundColor(.white)
            
            HStack{
                VStack(alignment: .leading){
                    Text(String(beachInformation.isqa))
                        .font(.title)
                        .padding(.top, 15)
                    Text(TextViewModel(isqa: beachInformation.isqa).getStatus())
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(TextViewModel(isqa: beachInformation.isqa).getStatusColor())
                    
                    Spacer()
                    Text(beachInformation.beachName)
                        .font(.headline)
                        .padding(.bottom, 15)
                    
                }.padding(.leading, 15)
                
                Spacer()
                VStack(){
                    Button{
                        if BeachCardViewModel.shared.savedBeachCards.contains(where: { $0.id == beachInformation.id }) {
                            // If it's saved, remove it from UserDefaults
                            BeachCardViewModel.shared.removeBeachCard(beachInformation)
                        } else {
                            // If it's not saved, save it to UserDefaults
                            BeachCardViewModel.shared.saveBeachCard(beachInformation)
                        }
                    }label: {
                        
                        
                        Image(systemName: "heart.fill")
                            .padding(.top, 15)
                            .padding(.trailing, 15)
                            .foregroundColor(BeachCardViewModel.shared.savedBeachCards.contains(where: { $0.id == beachInformation.id }) ? .red : .gray)
                            .font(.system(size: 20))
                        
                    }
                    Spacer()
                }.frame(height: UIScreen.main.bounds.height * 0.15)
                
            }
            
        }.frame(width: UIScreen.main.bounds.width * 0.5 , height: UIScreen.main.bounds.height * 0.15)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        
        
        
        
    }
}

//#Preview {
//    HorizontalCardComponent(isqa: 80,  name: "Ancol", saved: true)
//}


