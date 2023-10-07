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
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                
                .stroke(.black, lineWidth: 2)
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.05)
                .overlay{
                    HStack{

                        Image(systemName: "magnifyingglass")
                            .padding(.leading, 10)
                       
                        TextField("Search", text: $searchText)
                       
                    }
                    
                    
                }
        }
    }
}

#Preview {
    SearchBar(searchText: .constant(""))
}
