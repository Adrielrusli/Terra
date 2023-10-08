//
//  SearchBar.swift
//  Terra
//
//  Created by Adriel Bernard Rusli on 07/10/23.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText : String
    
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
//                .stroke(lineWidth: 2)
//                .opacity(0.12)
                
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.04)
                .overlay{
                    HStack{

//                        Image(systemName: "magnifyingglass")
//                            .padding(.leading, 10)
                       
                        TextField("Search", text: $searchText)
                            .padding(.leading, 20)
                        
                        Circle()
                            .foregroundColor(.blue)
                            .overlay{
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.white)
                            }
                        
                            
                       
                    }
                    
                    
                }
        }
    }
}

#Preview {
    SearchBar(searchText: .constant(""))
}
