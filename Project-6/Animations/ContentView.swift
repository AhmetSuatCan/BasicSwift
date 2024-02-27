//
//  ContentView.swift
//  Animations
//
//  Created by Ahmet on 27.02.2024.
//

import SwiftUI

struct CornerRotateModifier : ViewModifier {
    let amount : Double
    let anchor : UnitPoint
    
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor:anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount:0, anchor: .topLeading))
    }
}



struct ContentView: View {
    var letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var isShowingRed = false
    @State private var dragAmount = CGSize.zero
    
                        
    var body: some View {
    
        HStack(spacing: 0){
            ForEach(0..<letters.count, id: \.self){ num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .yellow)
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
            }
            
            .gesture(
                DragGesture()
                    .onChanged{
                        dragAmount = $0.translation
                    }
                    .onEnded{ _ in
                        dragAmount = .zero
                        enabled.toggle()
                        
                    }
            
            
            )
        }
        
        
        
//        Button("Tap Me"){
////            animationAmount += 1
//        }
//        .padding(50)
//        .background(.red)
//        .foregroundStyle(.white)
//        .clipShape(.circle)
//        .overlay(
//        Circle()
//            .stroke(.red)
//            .scaleEffect(animationAmount)
//            .opacity(2 - animationAmount)
//            .animation(
//                .easeInOut(duration: 1)
//                .repeatForever(autoreverses: false),
//                value: animationAmount)
//        )
//        .onAppear(){
//            animationAmount = 2
//        }
        
        
        
    }
    
}

#Preview {
    ContentView()
}
