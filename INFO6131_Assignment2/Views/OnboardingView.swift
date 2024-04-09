//
//  OnboardingView.swift
//  INFO6131_Assignment2
//
//  Created by Shaelyn Strong on 2024-04-09.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("hasShownOnboarding") private var hasShownOnboarding = false
    
    var body: some View {
        VStack {
            Text("Welcome to the app!")
            Button("Continue") {
                hasShownOnboarding = true
            }
        }
    }
}

