//
//  ContentView.swift
//  500 Miles
//
//  Created by Alison Gorman on 12/21/20.
//

import SwiftUI


struct ContentView: View {
    @State private var inputLength = ""
    @State private var inputUnit = 1
    @State private var outputUnit = 0
    
    let inputUnits = ["m","km","ft","yards","miles"]
    let outputUnits = ["m","km","ft","yards","miles"]
    
    var outputLength : String {
        switch outputUnit {
        case 0: //m
            return String(format: "%.2f", inputMeters) + " meters"
        case 1: //km
            return String(format: "%.2f", inputMeters/1000) + " kilometers"
        case 2: //ft
            return String(format: "%.2f", inputMeters*3.281) + " feet"
        case 3: //yards
            return String(format: "%.2f", inputMeters*1.094) + " yards"
        case 4: //miles
            return String(format: "%.2f", inputMeters/1609) + " miles"
        default:
            return String("no solution")
        }
    }
    
    var inputMeters: Double {
        switch inputUnit {
        case 0: //m
            return Double(inputLength) ?? 0
        case 1: //km
            return (Double(inputLength) ?? 0)*1000
        case 2: //ft
            return (Double(inputLength) ?? 0)/3.281
        case 3: //yards
            return (Double(inputLength) ?? 0)/1.094
        case 4: //miles
            return (Double(inputLength) ?? 0)*1609
        default:
            return 0
        }
    }
        
    
    var body: some View {
        NavigationView{
        Form {
            Section(header: Text("Convert From: ")) {
            TextField("Length", text: $inputLength)
                .keyboardType(/*@START_MENU_TOKEN@*/.decimalPad/*@END_MENU_TOKEN@*/)
                
                Picker("Input Unit: ", selection: $inputUnit) {
                    ForEach(0 ..< inputUnits.count) {
                        Text("\(self.inputUnits[$0])")
                    }
                } .pickerStyle(SegmentedPickerStyle())
                }
            
            Section(header: Text("Convert To: ")) {
                Picker("Output Unit: ", selection: $outputUnit) {
                    ForEach(0 ..< outputUnits.count) {
                        Text("\(self.outputUnits[$0])")
                    }
                } .pickerStyle(SegmentedPickerStyle())
                
                Text("\(outputLength)")
            }
        }.navigationTitle("I Would Walk 500 Miles")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
