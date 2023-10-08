//
//  CautionView.swift
//  Terra
//
//  Created by Adriel Bernard Rusli on 08/10/23.
//

import SwiftUI


enum FilterOption: String, CaseIterable {
    case Endangered = "Endangered"
    case Hazardous = "Hazardous"
}

struct CautionView: View {
    
    @State private var selectedFilter: FilterOption = .Endangered
    
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "Blue")
        
        
    }
    
    @State private var creatures = CreatureCard.generateDummyDataCreature()
    
    @State private var shouldOpenCreatureDetail = false
    
    var filteredCreatures: [CreatureCard] {
        if selectedFilter == .Hazardous {
            return creatures.filter { $0.dangerousState }
        } else if selectedFilter == .Endangered {
            return creatures.filter { !$0.dangerousState }
        } else {
            return creatures
        }
    }
    
    @StateObject var viewModel = BeachCardViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            let contentwidth = geometry.size.width * 0.9
            
            ZStack{
                Color("BackgroundColor")
                VStack(alignment: .leading , spacing: 15){
                    Text("Be Aware")
                        .font(.system(size: 32))
                        .bold()
                    Text("The beach is home to many creatures, some of which can be dangerous or endangered. Be careful and respectful to them, and get help if you are hurt or see any trouble.")
                }.frame(width: contentwidth)
                    .position(x: geometry.size.width / 2 , y: geometry.size.height * 0.2)
                
                Picker("Filter", selection: $selectedFilter){
                    ForEach(FilterOption.allCases, id: \.self) {
                        option in
                        Text(option.rawValue)
                        
                        
                    }
                }.pickerStyle(SegmentedPickerStyle())
                    .frame(width: contentwidth, height: 40)
                    .position(x: geometry.size.width / 2  , y: geometry.size.height * 0.35)
                    .background(Color("Blue").opacity(0.12))
                    .onChange(of: selectedFilter) { newFilter in
                        print("Selected option: \(newFilter.rawValue)")
                    }
                
                ScrollView{
                    VStack(spacing: 10){
                        ForEach(filteredCreatures, id: \.id) { creature in
                            ZStack{
                                Image(creature.name)
                                    .resizable()
                                
                                HStack(alignment: .bottom){
                                    Text(creature.name)
                                        .foregroundColor(.black)
                                        .font(.title3)
                                        .bold()
                                        .padding(.leading, 15)
                                        .offset(y: 30)
                                    Spacer()
                                }
                                
                                
                            }.frame(width: contentwidth, height: geometry.size.height * 0.2)
                                .background(Color(.white))
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .onTapGesture{
                                    shouldOpenCreatureDetail = true
                                    viewModel.selectedCreatureCard = creature
                                    print(creature)
                                }
                                
                        }
                    }
                }.frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.6)
                    .position(x: geometry.size.width / 2 , y: geometry.size.height * 0.715)
                    .fullScreenCover(isPresented: $shouldOpenCreatureDetail) {
                        if let selectedCreatureCard = viewModel.selectedCreatureCard {
                            CreatureDetailView(creatureInformation: selectedCreatureCard, shouldOpenCreatureDetail: $shouldOpenCreatureDetail)
                        }
                    }

                
                
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    CautionView()
}
