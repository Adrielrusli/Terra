//
//  BeachDetailView.swift
//  Terra
//
//  Created by Adriel Bernard Rusli on 07/10/23.
//

import SwiftUI

struct BeachDetailView: View {
    @Binding var beachName : String
    var body: some View {
        
        Text(beachName)
    }
}
//
//#Preview {
//    BeachDetailView()
//}
