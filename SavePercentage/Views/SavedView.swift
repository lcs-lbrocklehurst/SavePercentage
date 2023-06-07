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
    //needed to query database
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?

    
    //the List of saved Games
   
    
    //the item currently being added
    @State var searchText = ""
    
    //MARK: computed Properties
    var body: some View {
        NavigationView() {
            VStack {
                SavedItemsView(filteredOn: searchText)
                .searchable(text: $searchText)
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
