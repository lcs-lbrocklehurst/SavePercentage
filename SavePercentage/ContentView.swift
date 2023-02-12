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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
