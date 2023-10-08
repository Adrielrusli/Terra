//
//  CautionView.swift
//  Terra
//
//  Created by Adriel Bernard Rusli on 08/10/23.
//

import SwiftUI

struct TextColorModifier: ViewModifier {
    let selectedOption: FilterOption
    let selectedFilter: FilterOption
    
    func body(content: Content) -> some View {
        if selectedOption == selectedFilter {
            return content.foregroundColor(.white)
        } else {
            return content.foregroundColor(.black)
        }
    }
}

enum FilterOption: String, CaseIterable {
    case Endangered = "Endangered"
    case Hazardous = "Hazardous"
}

struct CautionView: View {
    
    @State private var selectedFilter: FilterOption = .Endangered
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "Blue")
    

    }
    var body: some View {
        GeometryReader { geometry in
            let contentwidth = geometry.size.width * 0.9
            
            ZStack{
                Color("BackgroundColor")
//                VStack(alignment: .leading , spacing: 15){
//                Text("Be Aware")
//                        .font(.system(size: 32))
//                        .bold()
//                Text("The beach is home to many creatures, some of which can be dangerous or endangered. Be careful and respectful to them, and get help if you are hurt or see any trouble.")
//                }.frame(width: contentwidth)
                
                Picker("Filter", selection: $selectedFilter){
                    ForEach(FilterOption.allCases, id: \.self) {
                        option in
                        Text(option.rawValue)
                            
                               
                    }
                }.pickerStyle(SegmentedPickerStyle())
                    .frame(width: contentwidth)
                    .background(Color("Blue").opacity(0.12))
                    .onChange(of: selectedFilter) { newFilter in
                        print("Selected option: \(newFilter.rawValue)")
                    }
                    
                    
                
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    CautionView()
}
