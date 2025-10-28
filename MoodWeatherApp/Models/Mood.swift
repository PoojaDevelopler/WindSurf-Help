//
//  Mood.swift
//  MoodWeatherApp
//
//  Created on Oct 28, 2025
//

import SwiftUI

enum Mood: String, CaseIterable, Identifiable {
    case happy = "☀️ Happy"
    case sad = "🌧️ Sad"
    case angry = "🌩️ Angry"
    case calm = "🌈 Calm"
    
    var id: String { self.rawValue }
    
    // SF Symbol for each mood
    var symbol: String {
        switch self {
        case .happy:
            return "sun.max.fill"
        case .sad:
            return "cloud.rain.fill"
        case .angry:
            return "cloud.bolt.fill"
        case .calm:
            return "cloud.sun.fill"
        }
    }
    
    // Gradient colors for each mood
    var gradientColors: [Color] {
        switch self {
        case .happy:
            return [
                Color(red: 1.0, green: 0.85, blue: 0.4),  // Warm yellow
                Color(red: 1.0, green: 0.6, blue: 0.3)    // Soft orange
            ]
        case .sad:
            return [
                Color(red: 0.5, green: 0.6, blue: 0.75),  // Muted blue
                Color(red: 0.4, green: 0.45, blue: 0.6)   // Deep blue-grey
            ]
        case .angry:
            return [
                Color(red: 0.8, green: 0.3, blue: 0.3),   // Soft red
                Color(red: 0.6, green: 0.2, blue: 0.4)    // Deep purple-red
            ]
        case .calm:
            return [
                Color(red: 0.6, green: 0.85, blue: 0.9),  // Soft cyan
                Color(red: 0.7, green: 0.9, blue: 0.7)    // Mint green
            ]
        }
    }
    
    // Icon color to complement the background
    var iconColor: Color {
        switch self {
        case .happy:
            return Color.white.opacity(0.95)
        case .sad:
            return Color.white.opacity(0.9)
        case .angry:
            return Color.white.opacity(0.95)
        case .calm:
            return Color.white.opacity(0.9)
        }
    }
    
    // Display name without emoji
    var displayName: String {
        switch self {
        case .happy:
            return "Happy"
        case .sad:
            return "Sad"
        case .angry:
            return "Angry"
        case .calm:
            return "Calm"
        }
    }
    
    // Emoji only
    var emoji: String {
        switch self {
        case .happy:
            return "☀️"
        case .sad:
            return "🌧️"
        case .angry:
            return "🌩️"
        case .calm:
            return "🌈"
        }
    }
}
