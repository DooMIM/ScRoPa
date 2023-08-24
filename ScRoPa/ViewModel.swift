//
//  ViewModel.swift
//  ScRoPa
//
//  Created by doha moustafa on 16/08/2023.
//

import Foundation


class GameLogic: ObservableObject {
    
    @Published var userChoice: GameChoice?
    @Published var computerChoice: GameChoice = .rock
    @Published var alertMessage: String = ""
    @Published var animationAmount = 1.2
    
    @Published var scissorsTapped = false
    @Published var paperTapped = false
    @Published var rockTapped = false
    
    func beats( userChoice: GameChoice, computerChoice: GameChoice) -> GameResult {
        switch (userChoice, computerChoice) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            return .win
        case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
            return .lose
        default:
            return .draw
        }
    }
    
    func playGame() {
        guard let userChoice = userChoice else { return }
        let result = beats(userChoice: userChoice, computerChoice: computerChoice)
        switch result {
        case .win:
            alertMessage = "You Win!"
        case .lose:
            alertMessage = "You Lose!"
        case .draw:
            alertMessage = "It's a Draw!"
        }
    }
    
    func onRockButtonTapped() {
        userChoice = .rock
        computerChoice = GameChoice.random
        playGame()
    }
    
    func onPaperButtonTapped() {
        userChoice = .paper
        computerChoice = GameChoice.random
        playGame()
    }
    
    func onScissorsButtonTapped() {
        userChoice = .scissors
        computerChoice = GameChoice.random
        playGame()
    }
}
