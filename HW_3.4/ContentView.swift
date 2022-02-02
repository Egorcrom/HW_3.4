//
//  ContentView.swift
//  HW_3.4
//
//  Created by Егор Кромин on 01.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = 0.5
    
    
    @State private var showAlert = false
    
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
                .font(.footnote)
                .padding()
            UIKitSlider(target: $targetValue,
                        current: $currentValue)
                .padding()
            Button("Проверь меня!", action: checkScore).padding()
            Button("Начать заново", action: restart).padding()
        }
        .alert("Your Score", isPresented: $showAlert, actions: {}) {
            Text("Cчет:\(computeScore())\nЗнаение слайдера:\(lround(currentValue * 100))")
        }
    }
    
    private func checkScore() {
        showAlert.toggle()
    }
    
    private func restart() {
        targetValue = Int.random(in: 0...100)
        
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue * 100))
        return 100 - difference
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
