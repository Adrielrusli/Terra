//
//  BeachDetailView.swift
//  Terra
//
//  Created by Adriel Bernard Rusli on 07/10/23.
//

import SwiftUI

struct BeachDetailView: View {
    var beachInformation: BeachCard
    @Binding var shouldOpenDetail : Bool
    @State var shouldOpenEmail = false
    var body: some View {
        
        
        GeometryReader{ geometry in
            
            let contentwidth = geometry.size.width * 0.9
            
            ZStack{
                
                Color("BackgroundColor")
                
                HStack(alignment: .center){
                    Button{
                        shouldOpenDetail = false
                    }label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                        
                    }
                    
                    Text(beachInformation.beachName)
                        .font(.title2)
                        .padding(.leading, 20)
                    Spacer()
                    
                    Button{
                        if BeachCardViewModel.shared.savedBeachCards.contains(where: { $0.id == beachInformation.id }) {
                            // If it's saved, remove it from UserDefaults
                            BeachCardViewModel.shared.removeBeachCard(beachInformation)
                        } else {
                            // If it's not saved, save it to UserDefaults
                            BeachCardViewModel.shared.saveBeachCard(beachInformation)
                        }
                    }label: {
                        if BeachCardViewModel.shared.savedBeachCards.contains(where: { $0.id == beachInformation.id }){
                            Image(systemName: "heart.fill")
                                .foregroundColor(Color("HeartRed"))
                        }else {
                            Image(systemName: "heart")
                                .foregroundColor(Color("HeartRed"))
                        }
                    }
                }.font(.system(size: 25))
                    .frame(width: contentwidth)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.12)
                
                
                HStack(alignment: .center){
                    
                    Image(TextViewModel(isqa: beachInformation.isqa).getImage())
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width * 0.3)
                        .scaledToFit()
                    
                    Spacer()
                    
                    VStack(alignment: .center){
                        
                        Text("Water Quality Index")
                            .font(.headline)
                        
                        HStack(){
                            Text(String(beachInformation.isqa))
                                .font(.system(size: 80))
                            
                            Text("CoWQI")
                                .padding(.top , 30)
                        }
                        
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 150, height: 30)
                            .foregroundColor(TextViewModel(isqa: beachInformation.isqa).getStatusColor())
                        
                            .overlay{
                                Text(TextViewModel(isqa: beachInformation.isqa).getStatus())
                                    .foregroundColor(.white)
                                    .font(.headline)
                            }.padding(.top, -50)
                    }
                    .frame(width: geometry.size.width * 0.45)
                }.frame(width: contentwidth)
                //                    .background(Color.blue)
                    .position(x: geometry.size.width / 2 , y: geometry.size.height * 0.3)
                
                HStack{
                    
                    
                    VStack(alignment: .center){
                        HStack(alignment: .center){
                            Image(systemName: "sun.min.fill")
                            Text("UV Index")
                            
                            
                        }.font(.caption)
                        Text(String(beachInformation.uv))
                            .font(.title)
                            .padding(.top, 4)
                        
                    }
                    Spacer()
                    VStack(alignment: .center){
                        HStack(alignment: .center){
                            Image(systemName: "wind")
                            Text("Wind")
                            
                        }.font(.caption)
                        HStack(alignment: .center){
                            Text(String(beachInformation.windSpeed))
                                .font(.title)
                            Text("km/h")
                                .font(.system(size: 14))
                                .offset(y: 3.5)
                        }.padding(.top, 4)
                        
                    }
                    Spacer()
                    VStack(alignment: .center){
                        HStack(alignment: .center){
                            Image(systemName: "thermometer.low")
                            Text("Temperature")
                            
                        }.font(.caption)
                        HStack(alignment: .center){
                            
                            Text("\(beachInformation.temperature)")
                                .font(.title)
                            Text("°C")
                                .font(.system(size: 14))
                                .offset(y: 3.5)
                            
                        }.padding(.top, 4)
                        
                        
                    }
                    
                }.frame(width: geometry.size.width * 0.9)
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.45)
                
                
                ScrollView{
                    VStack(spacing: 15){
                        ZStack{
                            
                            Image("BeachDummyImage")
                                .resizable()
                            
                            
                        } .frame(width: contentwidth, height: geometry.size.height * 0.14)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        
                        VStack{
                            HStack{
                                Text("Spotted Marine Creature")
                                
                                Spacer()
                                Button{
                                    
                                }label: {
                                    Image(systemName: "chevron.right")
                                }
                                
                            }.frame(width: geometry.size.width * 0.8)
                            
                        }
                        .frame(width: contentwidth, height: geometry.size.height * 0.14)
                        .background(Color(.white))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        VStack(alignment: .center){
                            Spacer()
                            Image(systemName: "flag")
                            
                            Text("any Problem with this beach? ")
                            
                            Button{
                                if let url = URL(string: "mailto:recipient@example.com?subject=Your%20Subject%20Here") {
                                    UIApplication.shared.open(url)
                                }
                            }label: {
                                Text("Report")
                                    .underline()
                                
                            }
                            Spacer()
                            
                            
                        }.frame(width: contentwidth, height: geometry.size.height * 0.18)
                    }
                }.frame(width: contentwidth , height: geometry.size.height * 0.45)
                    .position(x: geometry.size.width / 2 , y: geometry.size.height * 0.74)
                
                
                
                
                
                
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    BeachDetailView(beachInformation: BeachCard(id: UUID(), isqa: 98, beachName: "Ancol", city: "Jakarta", temperature: 26, uv: 6, windSpeed: 7), shouldOpenDetail: .constant(true))
}
