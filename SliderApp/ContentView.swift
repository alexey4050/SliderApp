//
//  ContentView.swift
//  SliderApp
//
//  Created by testing on 23.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue: Double = 50
    @State private var targetValue: Int = Int.random(in: 0...100)
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Подвинь слайдер, как можно ближе к \(targetValue)")
                .padding()
                .font(.subheadline)
            SliderView(value: $currentValue, targetValue: $targetValue, computeScore: computeScore)
                .padding()
                .tint(.red)
            Button(action: {
                showAlert = true
            }) {
                Text("Проверь меня")
            }
            .padding(10)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Результат"), message: Text("Ваш результат: \(computeScore())"))
            }
            Button(action: {
                targetValue = Int.random(in: 0...100)
            }) {
                Text("Начать заново")
            }
        }
        .padding(25)
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - Int(currentValue))
        return 100 - difference
    }
}
#Preview {
    ContentView()
}
