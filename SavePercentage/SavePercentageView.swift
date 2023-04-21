//
//  SavePctView.swift
//  SavePercentage
//
//  Created by Lewis Brocklehurst on 2023-04-19.
//
import Blackbird
import SwiftUI

struct SavePercentageView: View {
    
    //MARK: Stored Properties
    
    // Acess the connection to the database (needed to add a new record)
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?
    
    @State var shots: Double = 0
    @State var goals: Double = 0
    
    
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
                    Text("Shots")
                        .font(.headline.smallCaps())
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                Stepper("\(shots.formatted(.number.precision(.fractionLength(0))))",
                        value: $shots,
                        in: 1...400)
                .padding()
                
                HStack {
                    Text("Goals")
                        .font(.headline.smallCaps())
                    
                    Spacer()
                    
                }
                .padding(.horizontal)
                
                HStack(spacing: 0) {
                    
                    Stepper("\(goals.formatted(.number.precision(.fractionLength(0))))",
                            value: $goals,
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
                    
                    Text("\(savePercentage.formatted(.number.precision(.fractionLength(3))))")
                 
                }
            
         

                Spacer()
            }
            
            Button(action: {
                
                Task {
                    //write to database
                    try await db!.transaction { core in try core.query("INSERT INTO SavePercentage (title, saves, shots, savePercentage) VALUES (?,?,?,?)",

                                                                       "empty title",

                                                                       saves,

                                                                        shots,
                                                                        savePercentage)

                    }
                }
                
           }, label: {
                Text("Save for later")

            })
           .buttonStyle(.borderedProminent)
            
        }
        .padding()
        .navigationTitle("Save Pct Calculator")
    }
    
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SavePercentageView()
                .environment(\.blackbirdDatabase, AppDatabase.instance)

        }
    }
}
