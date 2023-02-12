//
//  ContentView.swift
//  SavePercentage
//
//  Created by Lewis Brocklehurst on 2023-02-11.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: Stored Properties
    @State var shots: Double = 30
    @State var goals: Double = 1
    @State private var shotValue = 1
    @State private var saveValue = 1
    
    //MARK: Computed Properties
    var saves: Double {
        return shots - goals
    }
    
    var savePercentage: Double {
        return saves/shots
    }
    
    
    
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            Group {
                
                HStack {
                    Text("Saves")
                        .font(.headline.smallCaps())
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                Stepper("\(shotValue)",
                        value: $shotValue,
                        in: 1...400)
                
                .padding()
                
                HStack {
                    Text("Shots")
                        .font(.headline.smallCaps())
                    
                    Spacer()
                    
                }
                .padding(.horizontal)
                
                HStack(spacing: 0) {
                    
                    Stepper("\(saveValue)",
                            value: $saveValue,
                            in: 1...400)
                    
                    .padding()
                    
                }
                
                HStack {
                    Text("Save Percentage ")
                        .font(.headline.smallCaps())
                }
                .padding()
                HStack {
                    Text("=")
                    
                    TextField("0.00", text: .constant(""))
                    
                
                }
            
                

                           Spacer()
                }
            }
            
            
        
        
        .padding(.top, 10)
        .navigationTitle("Save Pct Calculator")
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                ContentView()
            }
        }
    }
}
