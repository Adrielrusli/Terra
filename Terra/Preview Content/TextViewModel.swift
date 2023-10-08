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
        if isqa >= 97 && isqa <= 100{
            return "Excellent"
        }else if isqa >= 92 && isqa <= 96{
            return "Danger"
        }else if isqa >= 70 && isqa <= 91{
            return "Medium"
        }else if isqa >= 50 && isqa <= 69{
            return "Bad"
        }else {
            return "Very Bad"
        }
    }
    
    func getImage() -> String {
        if isqa >= 97 && isqa <= 100{
            return "Excellent"
        }else if isqa >= 92 && isqa <= 96{
            return "Danger"
        }else if isqa >= 70 && isqa <= 91{
            return "Medium"
        }else if isqa >= 50 && isqa <= 69{
            return "Bad"
        }else {
            return "VeryBad"
        }
    }
    
    func getStatusColor() -> Color {
        if isqa >= 97 && isqa <= 100{
            return Color("ExcellentGreen")
        }else if isqa >= 92 && isqa <= 96{
            return Color("GoodGreen")
        }else if isqa >= 70 && isqa <= 91{
            return Color("MediumOrange")
        }else if isqa >= 50 && isqa <= 69{
            return Color("BadRed")
        }else {
            return Color("VeryBadRed")
        }
    }
}
