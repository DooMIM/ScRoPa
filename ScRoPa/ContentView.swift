//
//  ContentView.swift
//  ScRoPa
//
//  Created by doha moustafa on 14/08/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gameLogic = GameLogic()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Spacer()
                Section {
                    HStack {
                        Text("Computer's choice: ")
                        
                        Image("\(gameLogic.computerChoice.rawValue)")
                            .resizable()
                            .frame(width: 80, height: 80)
                    }
                }
                Spacer()
                Section {
                    Text("Choose:")
                    HStack {
                        
                        // Rock Button
                        Button(action: {
                            gameLogic.onRockButtonTapped()
                        }) {
                            Image("rock") // Add the image name here
                                .resizable()
                                .frame(width: 100, height: 100)
                        }.buttonStyle(ScaleButtonStyle())
                        
                        // Paper Button
                        Button(action: {
                            gameLogic.onPaperButtonTapped()
                            
                        })
                        {
                            Image("paper")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .scaleEffect(gameLogic.paperTapped ? 1.2 : 1.0)
                        }.buttonStyle(ScaleButtonStyle())
                        
                        //Scissors Button
                        Button(action: {
                            gameLogic.onScissorsButtonTapped()
                        }) {
                            Image("scissors")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .scaleEffect(gameLogic.scissorsTapped ? 1.25 : 1.0)
                        }.buttonStyle(ScaleButtonStyle())
                    }
                }
                Spacer()
                Section{
                    Text("Result: \(gameLogic.alertMessage)")
                    
                    
                }
                Spacer()
                Spacer()
            }
            
        }
    }
}


struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

