//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Ahmet on 24.02.2024.
//

import SwiftUI

struct ContentView: View {
    let options = ["Rock", "Paper", "Scissor"]
    let roundSituations = ["Lose", "Win", "Draw"]
    @State private var userScore = 0
    @State private var userChoice = 0
    @State private var computerChoice = 0
    @State private var currentRoundSituation = 0
    @State private var questionCount = 0
    @State private var isVisible = false
    @State private var showAlert = false
    @State private var finalScore = 0

    func compareChoices() {
        computerChoice = Int.random(in: 0 ... 2)

        if questionCount < 10 {
            questionCount += 1

            if userChoice == 0 && computerChoice == 1 {
                currentRoundSituation = 0
                userScore -= 1
            } else if userChoice == 0 && computerChoice == 2 {
                currentRoundSituation = 1
                userScore += 1

            } else if userChoice == 0 && computerChoice == 0 {
                currentRoundSituation = 2

            } else if userChoice == 1 && computerChoice == 0 {
                currentRoundSituation = 1
                userScore += 1
            } else if userChoice == 1 && computerChoice == 1 {
                currentRoundSituation = 2
            } else if userChoice == 1 && computerChoice == 2 {
                currentRoundSituation = 0
                userScore -= 1
            } else if userChoice == 2 && computerChoice == 0 {
                currentRoundSituation = 0
                userScore -= 1
            } else if userChoice == 2 && computerChoice == 1 {
                currentRoundSituation = 1
                userScore += 1
            } else if userChoice == 2 && computerChoice == 2 {
                currentRoundSituation = 2
            }
            isVisible = true

        } else {
            questionCount = 0
            finalScore = userScore
            userScore = 0
            isVisible = false
            showAlert = true
        }
    }

    var body: some View {
        ZStack {
            LinearGradient(colors: [.black, .gray], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Spacer()
                Text("Pick one of them").font(.largeTitle).foregroundStyle(.white).fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)

                HStack {
                    Button("🪨 Rock") {
                        userChoice = 0
                        compareChoices()

                    }.frame(width: 180, height: 100).font(.largeTitle).foregroundStyle(.white
                    ).background(.gray).clipShape(.capsule)

                    Button("📃 Paper") {
                        userChoice = 1
                        compareChoices()

                    }.frame(width: 180, height: 100).font(.largeTitle).foregroundStyle(.white
                    ).background(.gray).clipShape(.capsule)
                }
                HStack {
                    Button("✂️ Scissor") {
                        userChoice = 2
                        compareChoices()
                    }.frame(width: 180, height: 100).font(.largeTitle).foregroundStyle(.white
                    ).background(.gray).clipShape(.capsule)
                }

                Spacer()
                if isVisible {
                    VStack(spacing: 20) {
                        Text("\(options[userChoice]) vs \(options[computerChoice])").font(.system(size: 40, weight: .bold)).fontWeight(.bold).foregroundStyle(.white)
                        Text(roundSituations[currentRoundSituation]).font(.system(size: 40, weight: .bold)).fontWeight(.bold).foregroundStyle(.white)
                    }
                }
                Spacer()
                if isVisible {
                    Text("Your Score:\(userScore)").font(.system(size: 40, weight: .bold)).fontWeight(.bold).foregroundStyle(.white)
                }
                Spacer()
                Spacer()
            }

            .alert(isPresented: $showAlert) {
                Alert(title: Text("Game Over"), message: Text("Game is over. Your final score is: \(finalScore)"), dismissButton: .default(Text("Okay")))
            }
        }
    }
}

#Preview {
    ContentView()
}
