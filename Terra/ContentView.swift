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
            let itemwidth = geometry.size.width * 0.9
            
            ZStack(alignment: .leading) {
                Color(Color.blue)
                
                SearchBar(searchText: $searchText)
                    .position(x: widthmid, y: geometry.size.height * 0.15)
                
                HStack() {
                    Text("Saved")
                        .foregroundStyle(Color(.white))
                        .bold()
                        .font(.title2)
                    Spacer()
                }
                .frame(width: itemwidth)
                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.22)
                
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
                .position(x: widthmid, y: geometry.size.height * 0.33)
                
                HStack(alignment: .center) {
                    Text("Nearest Beach")
                        .foregroundStyle(Color(.white))
                        .bold()
                        .font(.title2)
                    Spacer()
                    
                    Spacer()
                    
                    Button {
                        // Handle button action here
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                    }
                }
                .frame(width: itemwidth)
                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.45)
                
                ScrollView(.vertical) {
                    VStack(spacing: 10) {
                        ForEach(beachDummyData) { beachCard in
                            VerticalCardComponent(beachInformation: beachCard)
                        }
                    }
                }
                .frame(width: itemwidth)
                .position(x: widthmid, y: geometry.size.height * 1)
             
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
