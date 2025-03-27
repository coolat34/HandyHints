//
//  ContentView.swift
//  HandyHints
//
//  Created by Chris Milne on 17/03/2025.
//

import SwiftUI

struct ContentView: View {
    @State var Len: Double = 0.0
    @State var Width: Double = 0.0
    @State var Height: Double = 0.0
    
    var measurements: [String] = ["Millimetres", "Centimetres", "Metres", "Inches", "Feet"]
    var notation: [String] = ["mm", "cm", "m", "in", "ft"]
    @State private var selectedMeasurement: String = "Millimetres"
    @State private var note: String = "mm"
    @State var myNote: Int = 0
    
    var bags: [String] = ["20 kg", "25 kg", "30 kg"]
    @State private var selectedBag: String = "20 kg"
    @State var pbags: Double = 0.0
    
    var body: some View {
     ZStack {
         Color(red: 0.85, green: 0.95, blue: 0.99 )
         .edgesIgnoringSafeArea(.all)  // Cover the entire screen
           
         VStack {
             Text("Concrete Calculator")
                 .padding()
                 .background(Color.white)
                 .cornerRadius(10)
                 .font(.largeTitle)
        

            HStack {
  //               Text("Measurements")
  //                   .font(.title).underline()
  //               Spacer()
                 
                 
                 Image("ConcreteSlab")
                     .resizable()
                     .scaledToFit()
                     .frame(width: 150, height: 150)
                 
             }
             HStack {
             Button {  }
                 label: {

                         Picker("Measurement", selection: $selectedMeasurement) {
                             ForEach(measurements, id: \.self) {
                                 Text($0)
                                     .font(.system(size: 24, weight: .bold))
                                 
                             } /// ForEach
                         } /// Picker
                         .pickerStyle(.segmented)
                         .onChange(of: selectedMeasurement) {
                             if let index = measurements.firstIndex(of: selectedMeasurement) {
                                 myNote = index
                                 note = notation[myNote]
                                 
                             } /// onChangeOf
                         } ///If Let
                     } /// Label
                 } /// HStack

                     
                 HStack {
                     Text("Bags")
                         .background(.yellow)
                         .font(.title3)
                     Button {  }
                     label: {
                         HStack {
                             Picker("bags", selection: $selectedBag) {
                                 ForEach(bags, id: \.self) {
                                     Text($0)
                                         .font(.system(size: 24, weight: .bold))
                                     
                                 } /// ForEach
                             } /// Picker
                             .pickerStyle(.segmented)
                     } /// HStack
                     } /// Label
                 } /// HStack
             .padding(20)
                 
             let valResult = DataHandler.padFigs(A:Len, B:Width, C:Height, D: note)
             
// MARK: Length
                GeometryReader { geometry in
                  HStack(spacing: 5) {
                    Text("Length")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .frame(width: geometry.size.width * 0.33)
                    .background(.yellow)
                      TextField("",value: $Len, format:. number)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .frame(width: geometry.size.width * 0.33)
                    .background(.orange)
                      Text(note)
                      .font(.largeTitle)
                      .foregroundColor(.black)
                      .frame(width: geometry.size.width * 0.33)
                      .background(.yellow)
                  } /// HStack
                } /// Geometry Reader
                .frame(height: 50)
// MARK: Width
             GeometryReader { geometry in
               HStack(spacing: 5) {
                      Text("Width")
                      .font(.largeTitle)
                      .foregroundColor(.black)
                      .frame(width: geometry.size.width * 0.33)
                      .background(.yellow)
                        TextField("",value: $Width, format:. number)
                      .font(.largeTitle)
                      .foregroundColor(.black)
                      .frame(width: geometry.size.width * 0.33)
                      .background(.orange)
                        Text(note)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .frame(width: geometry.size.width * 0.33)
                        .background(.yellow)
               } /// HStack
             } /// Geometry Reader
             .frame(height: 50)
             
// MARK: Height
             GeometryReader { geometry in
               HStack(spacing: 5) {
                      Text("Height")
                      .font(.largeTitle)
                      .foregroundColor(.black)
                      .frame(width: geometry.size.width * 0.33)
                      .background(.yellow)
                        TextField("",value: $Height, format:. number)
                      .font(.largeTitle)
                      .foregroundColor(.black)
                      .frame(width: geometry.size.width * 0.33)
                      .background(.orange)
                        Text(note)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .frame(width: geometry.size.width * 0.33)
                        .background(.yellow)
                  } /// HStack
                } /// Geometry Reader
                .frame(height: 50)
// MARK: Area
             GeometryReader { geometry in
               HStack(spacing: 5) {
                      Text("Area")
                      .font(.largeTitle)
                      .foregroundColor(.black)
                      .frame(width: geometry.size.width * 0.33)
                      .background(.yellow)
                   if note != "ft" {
                       Text("\(String(format: "%.2f",(valResult.Area))) sq.\(note)")
                           .font(.largeTitle)
                           .foregroundColor(.black)
                           .frame(width: geometry.size.width * 0.67)
                           .background(.orange)
                   } else {
                       let ftin = DataHandler.AreafeetToInches(A:Len, B:Width)
                       
                       Text("sq.\(String(format: "%.0f", ftin.IntFeet)) ft \(String(format: "%.1f", ftin.IntInches)) in")
                           .font(.largeTitle)
                           .foregroundColor(.black)
                           .frame(width: geometry.size.width * 0.67)
                           .background(.orange)
                   }
                   Text("\(String(format: "%.2f",(valResult.Area))) sq.\(note)")
                      .font(.largeTitle)
                      .foregroundColor(.black)
                      .frame(width: geometry.size.width * 0.67)
                      .background(.orange)
                  } /// HStack
                } /// Geometry Reader
                .frame(height: 50)
// MARK: Volume
             GeometryReader { geometry in
               HStack(spacing: 5) {
                      Text("Volume")
                      .font(.largeTitle)
                      .foregroundColor(.black)
                      .frame(width: geometry.size.width * 0.33)
                      .background(.yellow)
                   
                   if note != "ft" {
                       Text("\(String(format: "%.2f",(valResult.Volume))) cu.\(note)")
                           .font(.largeTitle)
                           .foregroundColor(.black)
                           .frame(width: geometry.size.width * 0.67)
                           .background(.orange)
                   } else {
                       let ftin = DataHandler.VolfeetToInches(A:Len, B:Width, C:Height)
                       
                       Text("cu.\(String(format: "%.0f", ftin.IntFeet)) ft \(String(format: "%.1f", ftin.IntInches)) in")
                           .font(.largeTitle)
                           .foregroundColor(.black)
                           .frame(width: geometry.size.width * 0.67)
                           .background(.orange)
                   }
                  } /// HStack
                } /// Geometry Reader
                .frame(height: 50)
             
  // MARK: Bags
             GeometryReader { geometry in
                 HStack(spacing: 5) {
                     Text("Bags")
                         .font(.largeTitle)
                         .foregroundColor(.black)
                         .frame(width: geometry.size.width * 0.33)
                         .background(.yellow)
                     
                     if bags == "20 kg" { let pbags = valResult.Bags20kg
                     } else
                     if bags = "25 kg" { let pbags = valResult.Bags25kg
                     } else {
                         let pbags = valResult.Bags30kg
                        }
                 Text("\(String(format: "%.2f",pbags))")
                     .font(.largeTitle)
                     .foregroundColor(.black)
                     .frame(width: geometry.size.width * 0.67)
                     .background(.orange)
                 }
                } /// HStack
              } /// Geometry Reader
              .frame(height: 50)
                 
                Spacer()
                Spacer()
                Spacer()
             Button(action: resetValues) {
                 
                 Label("Reset all values", systemImage:"eraser")
                     .font(.system(size: 24, weight: .bold))
                     .frame(maxWidth: .infinity)
             } /// Button
             .buttonStyle(.borderedProminent)

            }
     }
    }
    func resetValues() {
        Len = 0
        Width = 0
        Height = 0
    } /// func
}

#Preview {
    ContentView()
}




