//
//  ContentView.swift
//  HandyHints
//
//  Created by Chris Milne on 17/03/2025.
//
/*
 106 x 20kg bag = 0.01 cubic metre
 84  x 25kg bag = 0.01 cubic metre
 70  x 30kg bag = 0.01 cubic metre
 1kg = 2.204623 lb
 
 
 
 
 
 */



import SwiftUI

class DataHandler: ObservableObject {
    // MARK: - Pad
    static func padFigs(A: Double, B: Double, C: Double, D: String) ->  (Area: Double, Volume: Double, Bags20kg: Double, Bags25kg: Double, Bags30kg: Double) {
        var Area = 0.0; var Volume = 0.0; var Bags20kg = 0.0; var Bags25kg = 0.0; var Bags30kg = 0.0
        Area = A * B
        Volume =  A * B * C
        let Z: Double = convertToCubicMetres(X: Volume, Y: D)
        Bags20kg = Double(106 * Z.rounded(.up))
        Bags25kg = Double(84 * Z.rounded(.up))
        Bags30kg = Double(70 * Z.rounded(.up))
        return (Area, Volume, Bags20kg, Bags25kg, Bags30kg)
    }
    
    static func convertToCubicMetres(X: Double, Y: String) -> Double {
        var res = 0.0
        if Y == "mm" {  res = X / 1000
        } else
         if Y == "cm" { res = X / 100
        } else
        if Y == "in" { res = X / 61023.7
        } else
        if Y == "ft" { res = Double(Int(X) * 12) + (10 * (X - Double(Int(X)))  / 61023.7)
        } else {
            res = X }
        return res
    }
    
    static func VolfeetToInches(A: Double, B: Double, C: Double) -> (IntFeet: Double, IntInches: Double) {
        var IntFeet: Double = 0.0; var IntInches: Double = 0.0
        let AInches = Double(Int(A) * 12) + (10 * (A - Double(Int(A))))
        let BInches = Double(Int(B) * 12) + (10 * (B - Double(Int(B))))
        let CInches = Double(Int(C) * 12) + (10 * (C - Double(Int(C))))
        let TotInches = AInches * BInches * CInches
        IntFeet = Double(Int(TotInches / pow(12,3)))
        IntInches = Double(TotInches - (IntFeet * pow(12,3))) / 144
        return (IntFeet, IntInches)
    }
    
    static func AreafeetToInches(A: Double, B: Double) -> (IntFeet: Double, IntInches: Double) {
        var IntFeet: Double = 0.0; var IntInches: Double = 0.0
        let AInches = Double(Int(A) * 12) + (10 * (A - Double(Int(A))))
        let BInches = Double(Int(B) * 12) + (10 * (B - Double(Int(B))))
        let TotInches = AInches * BInches
        IntFeet = Double(TotInches / 144)
        let remainder = Double(TotInches.remainder(dividingBy: 144))
        IntInches = Double(remainder / 144 * 12)
        return (IntFeet, IntInches)
    }
    
}





