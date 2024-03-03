//
//  ContentView.swift
//  MeasurementConversion
//
//  Created by Ahmet on 18.02.2024.
//

import SwiftUI

struct ContentView: View {
   @State private var selectedInputMeasurement = "Meter"
    @State private var selectedOutputMeasurement = "Meter"
    @State private var inputValue = 0.0;
    @FocusState private var inputIsFocused : Bool
     let unitsOfMeasurements = ["Meter", "Kilometer", "Feet", "Inch"]
    var midValue: Double{
        inputToCentimeter(inputType: selectedInputMeasurement, inputValue: inputValue)
    }
    
    func inputToCentimeter(inputType: String, inputValue: Double ) -> Double{
        if inputType == "Meter"{return inputValue * 100}
        else if inputType == "Kilometer"{ return inputValue * 100000}
        else if inputType == "Feet"{ return inputValue * 30.48}
        else if inputType == "Inch"{ return inputValue * 2.54}
        return 0;
    
    }
    
    func CentimeterToOutput(midValue: Double, outputType: String) -> Double{
        if outputType == "Meter"{return midValue / 100}
        else if outputType == "Kilometer"{ return midValue / 100000}
        else if outputType == "Feet"{ return midValue / 30.48}
        else if outputType == "Inch"{ return midValue / 2.54}
        return 0;
        
    }
    
    var body: some View {
        NavigationStack{
            
        Form{
            //section for input segmented picker
            Section("Select an unit type for your input"){
                Picker("Output", selection: $selectedInputMeasurement){
                    ForEach(unitsOfMeasurements, id:\.self){
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            
            Section{
                TextField("Input", value: $inputValue, format: .number).keyboardType(.decimalPad).focused($inputIsFocused)
            }
         
        
            //section for output segmented picker
            Section("Select an unit type for conversion"){
                Picker("Output", selection: $selectedOutputMeasurement){
                    ForEach(unitsOfMeasurements, id:\.self){
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }
            //showing result
            Section("Converted Value"){
                Text(CentimeterToOutput(midValue: midValue ,outputType: selectedOutputMeasurement), format: .number)
            }
        }
        .navigationTitle("Unit Conversion")
        }
    }
}

#Preview {
    ContentView()
}
