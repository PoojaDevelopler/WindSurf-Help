//
//  MoodViewModel.swift
//  MoodWeatherApp
//
//  Created on Oct 28, 2025
//

import SwiftUI

@Observable
class MoodViewModel {
    var currentMood: Mood
    var showContent: Bool = false
    
    init() {
        // Start with a random mood
        self.currentMood = Mood.allCases.randomElement() ?? .calm
        
        // Trigger fade-in animation after a brief delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(.easeInOut(duration: 1.0)) {
                self.showContent = true
            }
        }
    }
    
    func selectMood(_ mood: Mood) {
        withAnimation(.easeInOut(duration: 0.6)) {
            currentMood = mood
        }
    }
}
