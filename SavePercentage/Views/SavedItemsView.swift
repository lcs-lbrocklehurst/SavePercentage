//
//  SavedItemsView.swift
//  SavePercentage
//
//  Created by Lewis Brocklehurst on 2023-06-06.
//
import Blackbird
import SwiftUI

struct SavedItemsView: View {
    
    //MARK: Stored Properties
    
    //needed to query the database
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?
    
    
    @State var searchText = ""
    
    @BlackbirdLiveModels var savedGames: Blackbird.LiveResults<SavePercentage>
    
    var body: some View {
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
      
            
        }
    //MARK: Initializer(s)
init(filteredOn searchText: String) {
    
    // Initialize the live models
    
    _savedGames = BlackbirdLiveModels({ db in
        try await SavePercentage.read(from: db,
        sqlWhere: "descripiton LIKE ?", "%\(searchText)%")
    })
        
    
    }
    
    
    

    //MARK: Functions
    func removeRows(at offsets: IndexSet) {
        
        Task {
            
            try await db!.transaction { core in
                
                //get the id of the item to be deleted
                var idlist = ""
                for offset in offsets {
                    idlist += "\(savedGames.results[offset].id),"
            }
                //remove the final comma
                print(idlist)
                idlist.removeLast()
                print(idlist)
                //delete the rows from the databse
                try core.query("DELETE FROM SavePercentage WHERE id IN (?)", idlist)
        }
      
        
        }
    }
}

struct SavedItemsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedItemsView(filteredOn: "")
        // Make the database available to this view in Xcodes preview
             .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
