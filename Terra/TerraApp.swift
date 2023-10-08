//
//  TerraApp.swift
//  Terra
//
//  Created by Adriel Bernard Rusli on 07/10/23.
//

import SwiftUI

@main
struct TerraApp: App {
    
    init() {
           // Change the navigation bar appearance here
        UINavigationBar.appearance().barTintColor = .white  // Set the desired background color
       }
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                    .tabItem(){
                        Image(systemName: "beach.umbrella")
                        Text("Coast")
                    }
                
                ContentView()
                    .tabItem(){
                        Image(systemName: "exclamationmark.triangle")
                        Text("Caution")
                    }
            }
            
        }
    }
}
