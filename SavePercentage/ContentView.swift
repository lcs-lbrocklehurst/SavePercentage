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
    @State var goals: Double = 2
    
    
    //MARK: Computed Properties
    var saves: Double {
        return shots - goals
    }
    
    var savePercentage: Double {
        return saves/shots
    }
    
    
    
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack {
                Text("Saves")
                    .font(.headline.smallCaps())
                
                Spacer()
            }
                       .padding(.horizontal)

                       HStack(spacing: 0) {
                           Text("#")

                           TextField("0.00", text: .constant(""))
                       }
            HStack {
                Text("Shots")
                    .font(.headline.smallCaps())
                
                Spacer()
                
            }
            .padding(.horizontal)
            
            HStack(spacing: 0) {
                Text("#")
                
                          TextField("0.00", text:     .constant(""))
                
            }
            
                       .padding()

                       Spacer()
            }
        
        
        .padding()
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
