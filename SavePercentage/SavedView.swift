//
//  SavedView.swift
//  SavePercentage
//
//  Created by Lewis Brocklehurst on 2023-04-20.
//
import Blackbird
import SwiftUI

struct SavedView: View {
    
    //MARK: Stored properties
    
    //the List of saved Games
    @BlackbirdLiveModels({ db in
        try await SavePercentage.read(from: db)
    }) var savedGames
    
    //the search term the user has provided
    @State var searchText = ""
    //MARK: computed Properties
    var body: some View {
        NavigationView() {
            
            List{
                
                ForEach(savedGames.results) { currentSavePercentage in
                    VStack(alignment: .leading) {
                        Text(currentSavePercentage.title)
                            .bold()
                            .font(.system(size: 23))
                        Text("shots:")
                            .font(.system(size: 20))
                        Text("\(currentSavePercentage.shots)")
                            .font(.system(size: 20))
                        Text("Saves:")
                            .font(.system(size: 20))
                        Text("\(currentSavePercentage.saves)")
                            .font(.system(size: 20))
                        Text("Save Percentage:")
                            .font(.system(size: 20))
                        Text("\(currentSavePercentage.savePercentage)")
                            .font(.system(size: 20))
                        
                      
                    }
                    
                    
                }
                .onDelete(perform: removeRows)
                
            }
           
            .navigationTitle("Saved games")
        }
        
    }
    
    
}
//MARK: Functions
func removeRows(at offsets: IndexSet) {
    
    //what item(s) were swiped?
    for offsets in offsets {
        print(offsets)
    }
            
}



struct SavedView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView()
        // Make the database available to this view in Xcodes preview
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
