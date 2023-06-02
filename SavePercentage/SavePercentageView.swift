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
    @State private var Title: String = ""
    @State var SavePercentageOpacity = 0.0
    
    
        //track whether current joke has been saved to Database
    @State var savedToDatabase = false
    
    //MARK: Computed Properties
    var saves: Double {
        return shots - goals
    }
    
    var savePercentage: Double {
        return saves/shots
    }
    
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            VStack {
                TextField("Add a new game", text: $Title)
                    .font(.title)
                    .padding(.horizontal)
                
              
            }
           
            
            
            Group {
                
                    
                    
                    HStack {
                        
                        
                        
                        Text("Shots")
                            .font(.system(size: 28))
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Stepper("\(shots.formatted(.number.precision(.fractionLength(0))))",
                            value: $shots,
                            in: 1...400)
                    .font(.system(size: 28))
                    .padding()
                    
                    HStack {
                        Text("Goals")
                            .font(.system(size: 28))
                        
                        Spacer()
                        
                    }
                    .padding(.horizontal)
                    
                    HStack(spacing: 0) {
                        
                        Stepper("\(goals.formatted(.number.precision(.fractionLength(0))))",
                                value: $goals,
                                in: 1...400)
                        .font(.system(size: 28))
                        .padding()
                        
                    }
                    
                    HStack {
                        Text("Save Percentage ")
                            .font(.system(size: 28))
                    }
                    .padding()
                    
                    HStack {
                        Text("=")
                            .font(.system(size: 28))
                        
                        Text("\(savePercentage.formatted(.number.precision(.fractionLength(3))))")
                            .font(.system(size: 28))
                        
                    }
                    
                    
                    
                    Spacer()
                }
                
                Button(action: {
                //reset the interface
                    // Reset the interface
                                         
                    Task {
                        //write to database
                        try await db!.transaction { core in try core.query("INSERT INTO SavePercentage (title, saves, shots, savePercentage) VALUES (?,?,?,?)",
                                                                           
                                                                           Title,
                                                                
                                                                           saves,
                                                            
                                                                           shots,
                                                                           savePercentage)
                            
                            
                        
                        }
                    }
                    
                }, label: {
                    Text("Save for later")
                    
                })
            //Once saved, disable the button so we can't save the joke twice
                

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

