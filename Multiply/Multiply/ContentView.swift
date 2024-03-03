//
//  ContentView.swift
//  Multiply
//
//  Created by Ahmet on 28.02.2024.
//

import SwiftUI

struct Question {
    var multiplier: Int = 2
    var multiplicand: Int = 3
    var questionText: String = ""
    var answer: Int = 0

    mutating func multiply(multiplier: Int, multiplicand: Int) {
        answer = multiplier * multiplicand
        questionText = "\(multiplier) x \(multiplicand) = ?"
    }
}

struct ContentView: View {
    let tablePreferences = ["One Table", "Multiple Tables"]
    @State private var usersTableChoice = "One Table"
    @State private var Questions = [Question]()
    @State private var multiplier = 2
    @State private var minMultiplier = 2
    @State private var maxMultiplier = 4
    @State private var isGameActive = false
    @State private var activeQuestionText = ""
    @State private var activeQuestionIndex = 0
    @State private var userAnswer = 0
    @FocusState private var answerIsFocused: Bool
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var answerFeedbackText = ""
    @State private var userScore = 0
    @State private var askedQuestions = [Int]()
    
    

    var body: some View {
        NavigationStack {
            
            Form {
                    // preference section:
                if !isGameActive {
                    Section {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Number of tables?").alignmentGuide(.leading) { _ in
                                0
                            }
                            Picker("Number of tables", selection: $usersTableChoice) {
                                ForEach(tablePreferences, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.segmented)

                            if usersTableChoice == "One Table" {
                                Picker("Table of:", selection: $multiplier) {
                                    ForEach(2 ..< 13, id: \.self) { number in
                                        Text(String(number))
                                    }
                                }

                            } else {
                                HStack {
                                    Stepper("from Table:", value: $minMultiplier, in: 2 ... maxMultiplier - 2)
                                    Spacer()
                                    Text("\(minMultiplier)")
                                }

                                HStack {
                                    Stepper("to table:", value: $maxMultiplier, in: minMultiplier + 2 ... 12)
                                    Spacer()
                                    Text("\(maxMultiplier)")
                                }
                            }
                        }
                        Button("Start Game") {
                            askedQuestions = [Int]()
                            isGameActive = true
                            Questions = [Question]()

                            if usersTableChoice == "One Table" {
                                createQuestions(multiplier: multiplier)

                            } else {
                                createQuestions(minMultiplier: minMultiplier, maxMultiplier: maxMultiplier)
                            }

                            askQuestion(questions: Questions)
                        }
                    }
                }

                // game section:
                if isGameActive {
                    Section {
                        VStack(spacing: 20) {
                            HStack {
                                Spacer()
                                Text(activeQuestionText).font(.largeTitle)
                                Spacer()
                            }
                        }
                        VStack {
                            TextField("Your Answer", value: $userAnswer, format: .number).keyboardType(.decimalPad).focused($answerIsFocused).font(.title)

                            Button("Answer") {
                                if isAnswerTrue(questionIndex: activeQuestionIndex){
                                    answerFeedbackText = "Correct!"
                                    userScore += 1
                                    
                                }else
                                {
                                    answerFeedbackText = "Wrong! Correct answer was \(Questions[activeQuestionIndex].answer)"
                                    if userScore != 0 {
                                        userScore -= 1
                                        
                                    }
                                    
                                }
                                if askedQuestions.count < 12{
                                    askQuestion(questions: Questions)
                                    
                                }else{
                                    showingAlert = true
                                    alertTitle = "The End"
                                }
                                
                            }
                        }
                    }
                    // Answer feedback and total score
                    Section {
                        VStack(spacing: 40){
                            
                            Text(answerFeedbackText)
                            Text("Your Score: \(userScore)").font(.title)
                        }

                    
                    }
                }
            }
            .alert(alertTitle,isPresented: $showingAlert){
                Button("Okay"){
                    isGameActive = false
                }
            } message : {
                Text("Game is over, your final score is: \(userScore)")
            }

            .navigationTitle("Multiply!")
            .toolbar {
                if isGameActive {
                    Button("Quit") {
                        isGameActive = false
                    }
                }
            }
        }
    }

    // for one table
    func createQuestions(multiplier: Int) {
        for _ in 1 ... 12 {
            var Question = Question()
            print(multiplier)
            Question.multiply(multiplier: multiplier, multiplicand: Int.random(in: 1 ... 12))

            Questions.append(Question)
        }
    }

    func createQuestions(minMultiplier: Int, maxMultiplier: Int) {
        for _ in 1 ... 12 {
            var Question = Question()
            let multiplier = Int.random(in: minMultiplier ... maxMultiplier)
            Question.multiply(multiplier: multiplier, multiplicand: Int.random(in: 1 ... 12))
            Questions.append(Question)
        }
    }

    func askQuestion(questions: Array<Question>) {
        activeQuestionIndex = Int.random(in: 0 ..< questions.count)
        
        if !askedQuestions.contains(activeQuestionIndex){
            
            activeQuestionText = questions[activeQuestionIndex].questionText
            askedQuestions.append(activeQuestionIndex)
        }else{
            askQuestion(questions: Questions)
        }
    }

    func isAnswerTrue(questionIndex: Int) -> Bool {
        if userAnswer == Questions[questionIndex].answer {
            return true
        } else {
            return false
        }
    }
}

#Preview {
    ContentView()
}
