//
//  ContentView.swift
//  MoodWeatherApp
//
//  Created on Oct 28, 2025
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = MoodViewModel()
    @State private var pulseScale: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            // Animated Background Gradient
            LinearGradient(
                colors: viewModel.currentMood.gradientColors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            .animation(.easeInOut(duration: 0.8), value: viewModel.currentMood)
            
            VStack(spacing: 0) {
                // Title at the top with fade-in
                Text("Mood Weather")
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .opacity(viewModel.showContent ? 1.0 : 0.0)
                    .offset(y: viewModel.showContent ? 0 : -20)
                    .padding(.top, 60)
                
                Spacer()
                
                // Center mood icon and name
                VStack(spacing: 24) {
                    // Animated SF Symbol with pulsing effect
                    Image(systemName: viewModel.currentMood.symbol)
                        .font(.system(size: 120))
                        .foregroundColor(viewModel.currentMood.iconColor)
                        .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 5)
                        .scaleEffect(pulseScale)
                        .opacity(viewModel.showContent ? 1.0 : 0.0)
                        .transition(.scale.combined(with: .opacity))
                        .id(viewModel.currentMood.rawValue) // Force recreation on mood change
                        .onAppear {
                            startPulseAnimation()
                        }
                        .onChange(of: viewModel.currentMood) { oldValue, newValue in
                            // Reset and restart pulse animation
                            pulseScale = 1.0
                            startPulseAnimation()
                        }
                    
                    // Mood name
                    Text(viewModel.currentMood.rawValue)
                        .font(.system(size: 28, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                        .opacity(viewModel.showContent ? 1.0 : 0.0)
                        .transition(.opacity)
                }
                .padding(.vertical, 40)
                
                Spacer()
                
                // Mood selection buttons
                VStack(spacing: 16) {
                    HStack(spacing: 12) {
                        MoodButton(
                            mood: .happy,
                            isSelected: viewModel.currentMood == .happy
                        ) {
                            viewModel.selectMood(.happy)
                        }
                        
                        MoodButton(
                            mood: .sad,
                            isSelected: viewModel.currentMood == .sad
                        ) {
                            viewModel.selectMood(.sad)
                        }
                    }
                    
                    HStack(spacing: 12) {
                        MoodButton(
                            mood: .angry,
                            isSelected: viewModel.currentMood == .angry
                        ) {
                            viewModel.selectMood(.angry)
                        }
                        
                        MoodButton(
                            mood: .calm,
                            isSelected: viewModel.currentMood == .calm
                        ) {
                            viewModel.selectMood(.calm)
                        }
                    }
                }
                .opacity(viewModel.showContent ? 1.0 : 0.0)
                .offset(y: viewModel.showContent ? 0 : 20)
                .padding(.bottom, 60)
            }
        }
    }
    
    // Pulsing animation for the mood icon
    private func startPulseAnimation() {
        withAnimation(
            .easeInOut(duration: 1.5)
            .repeatForever(autoreverses: true)
        ) {
            pulseScale = 1.15
        }
    }
}

#Preview {
    ContentView()
}
