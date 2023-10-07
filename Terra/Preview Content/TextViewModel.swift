//
//  TextViewModel.swift
//  Terra
//
//  Created by Adriel Bernard Rusli on 07/10/23.
//

import Foundation
import SwiftUI

struct TextViewModel {
    
    var isqa: Int
    
    func getStatus() -> String {
        if isqa < 80 && isqa > 50 {
            return "Warning"
        }else if isqa <= 50{
            return "Danger"
        } else {
            return "Good"
        }
    }
    
    func getStatusColor() -> Color {
        if isqa < 80 && isqa > 50 {
            return Color.yellow
        }else if isqa <= 50{
            return Color.red
        } else {
            return Color.green
        }
    }
}
