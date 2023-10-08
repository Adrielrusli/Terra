// ContentView.swift

import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var shouldOpenDetail = false
    @StateObject var viewModel = BeachCardViewModel()
    
    let beachDummyData = BeachCard.generateDummyData()
    
    

    
    var body: some View {
        
        GeometryReader { geometry in
            let widthmid = geometry.size.width / 2
            let heightmid = geometry.size.height / 2
            let itemwidth = geometry.size.width * 0.92
            
            ZStack(alignment: .leading) {
               Color("BackgroundColor")
                
                HStack{
                    Text("Beach")
                        .font(.system(size: 40))
                    Spacer()
                }.frame(width: itemwidth)
                    .position(x: widthmid, y: geometry.size.height * 0.1)
                    
                
                SearchBar(searchText: $searchText)
                    .position(x: widthmid, y: geometry.size.height * 0.16)
                
                HStack() {
                    Text("Saved")
                        .font(.title2)
                    Spacer()
                }
                .frame(width: itemwidth)
                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.21)
                
                let savedBeachCards = viewModel.savedBeachCards
                
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(savedBeachCards) { beachCard in
                            HorizontalCardComponent(beachInformation: beachCard)
                            // You can add your HorizontalCardComponent here if needed
                        }
                    }
                }
                .frame(width: itemwidth)
                .position(x: widthmid, y: geometry.size.height * 0.305)
                
                HStack(alignment: .center) {
                    Text("Near You")
                        .font(.title2)
                    Spacer()
                    
                    Spacer()
                    
                    Button {
                        // Handle button action here
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                    }
                }
                .frame(width: itemwidth)
                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.41)
                
                ScrollView(.vertical) {
                    VStack(spacing: 10) {
                        ForEach(beachDummyData) { beachCard in
                            VerticalCardComponent(beachInformation: beachCard)
                               
                                .onTapGesture {
                                    viewModel.selectedBeachCard = beachCard
                                    shouldOpenDetail = true
                                    print(shouldOpenDetail)
                                    print(beachCard)
                                }
                            
                              
                            
                        }
                    }
                }
                .fullScreenCover(isPresented: $shouldOpenDetail){
                    if let selectedBeachCard = viewModel.selectedBeachCard {
                        BeachDetailView(beachInformation: selectedBeachCard, shouldOpenDetail: $shouldOpenDetail)
                    }
                }
                .frame(width: itemwidth, height: geometry.size.height * 0.45)
                .position(x: widthmid, y: geometry.size.height * 0.67)
             
            }
            .ignoresSafeArea()
            .position(x: widthmid, y: heightmid)
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
