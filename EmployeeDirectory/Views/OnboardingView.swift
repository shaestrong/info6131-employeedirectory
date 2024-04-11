//
//  OnboardingView.swift
//  EmployeeDirectory
//
//  Created by Shaelyn Strong on 2024-04-10.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("isOnboardingCompleted") var isOnboardingCompleted = false

    var body: some View {
        VStack {
            Text("Welcome to the Employee Directory App!")
                .font(.title)
                .padding()
            Button("Get Started") {
                isOnboardingCompleted = true
            }
            .padding()
        }
    }
}
