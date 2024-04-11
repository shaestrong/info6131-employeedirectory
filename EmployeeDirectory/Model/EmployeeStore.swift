//
//  EmployeeStore.swift
//  EmployeeDirectory
//
//  Created by Shaelyn Strong on 2024-04-10.
//

import Foundation
import Combine

final class EmployeeStore {
    var employees: [Employee] = []
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        fetchEmployees()
    }
    
    private func fetchEmployees() {
        guard let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees.json") else {
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Employee].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching employees: \(error)")
                }
            }, receiveValue: { [weak self] employees in
                self?.employees = employees
            })
            .store(in: &cancellables)
    }
}
