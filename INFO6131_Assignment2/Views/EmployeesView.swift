//
//  EmployeesView.swift
//  INFO6131_Assignment2
//
//  Created by Shaelyn Strong on 2024-04-09.
//

import SwiftUI

struct EmployeesView: View {
    @ObservedObject var viewModel = EmployeeListViewModel()
    
    var body: some View {
        List(viewModel.employees) { employee in
            Text(employee.fullName)
        }
        .onAppear {
            viewModel.fetchEmployees()
        }
        .alert(isPresented: .constant(viewModel.error != nil)) {
            Alert(title: Text("Error"), message: Text(viewModel.error?.localizedDescription ?? "Unknown error"), dismissButton: .default(Text("OK")))
        }
        .overlay(viewModel.loading ? ProgressView() : nil)
    }
}
