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
    
    //MARK: computed Properties
    var body: some View {
        NavigationView() {
            List{
                
            }
            ForEach(savedGames.results) { currentSavePercentage in
                VStack(alignment: .leading) {
                    Text(currentSavePercentage.title)
                        .bold()
                    Text("shots:")
                    Text("\(currentSavePercentage.shots)")
                    Text("Saves:")
                    Text("\(currentSavePercentage.saves)")
                    Text("Save Percentage:")
                    Text("\(currentSavePercentage.savePercentage)")
                    
                }
                
            }
            .navigationTitle("Saved games")
        }
        
    }
}

struct SavedView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView()
        // Make the database available to this view in Xcodes preview
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
