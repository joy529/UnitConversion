//
//  ContentView.swift
//  UnitConversion
//
//  Created by JOY JAIN on 03/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var temperatureInput = 25.0
        
    let tempUnitInput = ["Celsius", "Fahrenheit", "Kelvin"]
    @State private var selectedInput = "Celsius"
        
    let tempUnitOutput = ["Celsius", "Fahrenheit", "Kelvin"]
    @State private var selectedOutput = "Fahrenheit"
    
    @FocusState private var inputIsFocused: Bool
    
    func tempConverter() -> Double {
            var output: Double
            if selectedInput == "Celsius" && selectedOutput == "Fahrenheit" {
                output = (temperatureInput * 9/5) + 32
                return output
            } else if selectedInput == "Celsius" && selectedOutput == "Kelvin" {
                output = (temperatureInput + 273.15)
                return output
            } else if selectedInput == "Fahrenheit" && selectedOutput == "Celsius" {
                output = (temperatureInput - 32) * 5/9
                return output
            } else if selectedInput == "Fahrenheit" && selectedOutput == "Kelvin" {
                output = (temperatureInput - 32) * 5/9 + 273.15
                return output
            } else if selectedInput == "Kelvin" && selectedOutput == "Celsius" {
                output = (temperatureInput - 273.15)
                return output
            } else if selectedInput == "Kelvin" && selectedOutput == "Fahrenheit" {
                output = (temperatureInput - 273.15) * 9/5 + 32
                return output
            } else {
                return temperatureInput
            }
    }
    
    var body: some View {
            NavigationView {
                Form {
                    Section {
                        Picker("Select unit", selection: $selectedInput) {
                            ForEach(tempUnitInput, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                    } header: {
                        Text("Choose your temperature unit")
                    }
                    
                    Section {
                        TextField("Enter the temperature", value: $temperatureInput, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($inputIsFocused)
                    } header: {
                        Text("Temperature in \(selectedInput)")
                    }
                    
                    Section {
                        Picker("Select unit to convert to", selection: $selectedOutput) {
                            ForEach(tempUnitOutput, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                    } header: {
                        Text("Choose your conversion unit")
                    }
                    
                    Section {
                        Text(tempConverter(), format: .number)
                    } header: {
                    Text("Temperature in \(selectedOutput)")
                    }
                }
                .navigationTitle("Temp Conversion")
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button("Done") {
                            inputIsFocused = false
                        }
                    }
                }
            }
        }
    }


#Preview {
    ContentView()
}
