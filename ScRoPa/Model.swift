//
//  Model.swift
//  ScRoPa
//
//  Created by doha moustafa on 16/08/2023.
//

import Foundation

enum GameChoice: String, CaseIterable {
    case rock = "rock"
    case paper = "paper"
    case scissors = "scissors"
}

enum GameResult {
    case win, lose, draw
}

extension GameChoice {
    static var random: GameChoice {
        let allCases = GameChoice.allCases
        let randomIndex = Int.random(in: 0..<allCases.count)
        return allCases[randomIndex]
    }
}
