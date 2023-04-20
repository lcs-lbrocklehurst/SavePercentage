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
    @State var shots: Double = 0
    @State var goals: Double = 0
    @State var currentSavePercentage: SavePercentage?
    
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
            
//            Button(action: {
                
//                Task {
//                    //write to database
//                    if let currentSavePercentage = currentSavePercentage {
//                        try await db!.Transaction { core in try core.query("INSERT INTO SAVEPERCENTAGE(id, title, saves, shots, savePercentage) VALUES (?,?,?,?,?) ",
//                                                                           currentSavePercentage.id,
//
//                                                                           currentSavePercentage.title,
//
//                                                                           currentSavePercentage.saves,
//
//                                                                           currentSavePercentage.shots,
//                                                                           currentSavePercentage.savePercentage)
//
//                        }
//                    }
//                }
//            }, Label: {
//                Text("save for later")
//
//            })
//            .buttonstyle(.borderedProminent)
            
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
