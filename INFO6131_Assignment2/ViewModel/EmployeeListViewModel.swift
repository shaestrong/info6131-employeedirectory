//
//  EmployeeListViewModel.swift
//  INFO6131_Assignment2
//
//  Created by Shaelyn Strong on 2024-04-09.
//

import Foundation

class EmployeeListViewModel: ObservableObject {
    @Published var employees: [Employee] = []
    @Published var loading: Bool = false
    @Published var error: Error?
    
    private let employeeLoader = EmployeeLoader()
    
    func fetchEmployees() {
        loading = true
        employeeLoader.fetchEmployees { result in
            DispatchQueue.main.async {
                self.loading = false
                switch result {
                case .success(let employees):
                    self.employees = employees
                case .failure(let error):
                    self.error = error
                }
            }
        }
    }
}
