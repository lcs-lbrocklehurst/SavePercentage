//
//  SavePct.swift
//  SavePercentage
//
//  Created by Lewis Brocklehurst on 2023-04-19.
//
import Blackbird
import Foundation

struct SavePercentage: Identifiable, BlackbirdModel {
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var saves: Int
    @BlackbirdColumn var shots: Int
    @BlackbirdColumn var savePercentage: Double
    @BlackbirdColumn var title: String
}

let exampleSavePercentage = SavePercentage(id: 1 , saves: 9, shots: 10, savePercentage: 0.900, title: "Game 1")
