//
//  INFO6131_Assignment2App.swift
//  INFO6131_Assignment2
//
//  Created by Shaelyn Strong on 2024-04-09.
//

import SwiftUI

@main
struct EmployeeDirectoryApp: App {
    @AppStorage("hasShownOnboarding") private var hasShownOnboarding = false
    
    var body: some Scene {
        WindowGroup {
            if hasShownOnboarding {
                EmployeesView()
            } else {
                OnboardingView()
            }
        }
    }
}
