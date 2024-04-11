//
//  EmployeeDirectoryApp.swift
//  EmployeeDirectory
//
//  Created by Shaelyn Strong on 2024-04-10.
//

import SwiftUI

@main
struct EmployeeDirectoryApp: App {
    @StateObject var viewModel = EmployeeListViewModel()

    var body: some Scene {
        WindowGroup {
            if viewModel.isDataLoaded {
                TabView {
                    EmployeeListView(viewModel: viewModel)
                        .tabItem {
                            Label("Employees", systemImage: "person.3.fill")
                        }
                    SettingsView()
                        .tabItem {
                            Label("Settings", systemImage: "gearshape.fill")
                        }
                }
            } else {
                ProgressView() // Show a loading indicator until data is loaded
            }
        }
    }
}

