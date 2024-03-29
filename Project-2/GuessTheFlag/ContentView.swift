//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ahmet on 18.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()

    @State private var correctAnswer = Int.random(in: 0 ... 2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    @State private var questionCount = 0
    @State private var isTapped = Array(repeating: true, count: 3)
    @State private var animationAmounts = Array(repeating: 0.0, count: 3)
    @State private var scaleAmounts = Array(repeating: 1.0, count: 3)
    @State private var tappingActive = false
    

    @State private var showingAlert = false
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()

            VStack {
                Spacer()
                Text("Guess the flag").font(.largeTitle.bold()).foregroundStyle(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag off")
                            .foregroundStyle(.secondary).font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0 ..< 3) { number in
                        Button {
                            isTapped = Array(repeating: false, count: 3)
                            withAnimation{
                                isTapped[number] = true
                                animationAmounts[number] += 360
                                
                            }
                            
                            
                            withAnimation(.spring(duration: 1, bounce:0.5)){
                                scaleAmounts = Array(repeating: 0.75, count: 3)
                                scaleAmounts[number] = 1
                            }
                            tappingActive = true
                            flagTapped(number)
                            
                                

                        } label: {
                            Image(countries[number]).clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                        .opacity(isTapped[number] ? 1: 0.25)
                        .rotation3DEffect(.degrees(animationAmounts[number]), axis:(x:0, y:1, z:0))
                        .scaleEffect(scaleAmounts[number])
                        
                            
                            
                            
                        
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Score \(userScore)").foregroundStyle(.white).font(.title.bold())

                Spacer()
            }.padding()

                .alert(scoreTitle, isPresented: $showingScore) {
                    Button("Continue", action: askQuestion)
                } message: {
                    if questionCount < 8 {
                        if scoreTitle == "Wrong" {
                            Text("Wrong Answer! This flag belongs to the \(countries[correctAnswer])")

                        } else {
                            Text("Correct! This flag belongs to the \(countries[correctAnswer])")
                            Text("Your score is now: \(userScore)")
                        }
                    } else {
                        Text("Game is over. Your final score is \(userScore)")
                    }
                }
        }
    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1
        } else {
            scoreTitle = "Wrong"
            userScore -= 1
        }
        showingScore = true
        animationAmounts[number] = 0.0
    
    }

    func askQuestion() {
        if questionCount < 8 {
            questionCount += 1
        } else {
            questionCount = 0
            userScore = 0
        }
        countries.shuffle()
        correctAnswer = Int.random(in: 0 ... 2)
        isTapped = Array(repeating: true, count: 3)
        scaleAmounts = Array(repeating: 1.0, count: 3)

        
       
    }
}

#Preview {
    ContentView()
}
