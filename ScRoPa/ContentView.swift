//
//  ContentView.swift
//  ScRoPa
//
//  Created by doha moustafa on 14/08/2023.
//

import SwiftUI

enum GameChoice: String, CaseIterable {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
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


struct ContentView: View {

    @State private var userChoice: GameChoice?
    @State private var computerChoice: GameChoice = .rock
    @State private var alertMessage: String = ""
    @State private var animateUserChoice: Bool = false
    @State private var animationAmount = 1.0

    @State private var scissorsTapped = false
    @State private var paperTapped = false
    @State private var rockTapped = false
    
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
    
    private func playGame() {
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
    
    private func onRockButtonTapped() {
        userChoice = .rock
        computerChoice = GameChoice.random
        animateUserChoice = true
        playGame()
    }
    
    private func onPaperButtonTapped() {
        userChoice = .paper
        computerChoice = GameChoice.random
        animateUserChoice = true
        playGame()
    }
    
    private func onScissorsButtonTapped() {
        userChoice = .scissors
        computerChoice = GameChoice.random
        animateUserChoice = true
        playGame()
    }


    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Section {
                
                Text("Computer's choice: ?? ")
            }
            Spacer()
            Section {
            Text("Choose:")
                HStack {

                    // Rock Button
                    Button(action: onRockButtonTapped, label: {
                        Image("rock") // Add the image name here
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaleEffect(rockTapped ? 1.1 : 1.0)

                    }).onTapGesture {
                        withAnimation(.spring(response: 0.9, dampingFraction: 0.1).repeatCount(2)) {
                            rockTapped.toggle()
                        }
                    }
                    
                    // Paper Button
                    Button(action: onPaperButtonTapped, label: {
                        Image("paper")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaleEffect(paperTapped ? 1.2 : 1.0)
                    }).onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            paperTapped.toggle()
                        }
                    }
                    
                    //Scissors Button
                    Button(action: onScissorsButtonTapped, label: {
                        Image("scissors")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaleEffect(scissorsTapped ? 1.25 : 1.0)
                    }).onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            scissorsTapped.toggle()
                        }
                    }
                }
                Spacer()
            
            }
            Section{
                Text("Result: \(alertMessage)")
            }
            Spacer()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
