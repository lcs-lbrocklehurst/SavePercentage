//
//  SavePct.swift
//  SavePercentage
//
//  Created by Lewis Brocklehurst on 2023-04-19.
//

import Foundation

struct SavePercentage: Identifiable {
    var id: Int
    let saves: Int
    let shots: Int
    let savePercentage: Double
    let title: String
}

let exampleSavePercentage = SavePercentage(id: 1 , saves: 9, shots: 10, savePercentage: 0.900, title: "Game 1")
