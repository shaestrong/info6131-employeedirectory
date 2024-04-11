//
//  EmployeeListViewModel.swift
//  EmployeeDirectory
//
//  Created by Shaelyn Strong on 2024-04-10.
//

import Foundation
import Combine

final class EmployeeListViewModel: ObservableObject {
    @Published var employees: [Employee] = []
    @Published var isDataLoaded: Bool = false // Add isDataLoaded property

    // Computed Properties
    var listData: [Employee] {
        return searchTerm.isEmpty ? employees : searchResults
    }

    var displayCount: String {
        "\(listData.count) employees"
    }

    var searchTerm: String = "" {
        didSet {
            filterSearchResults()
        }
    }

    var searchResults: [Employee] = []

    init() {
        fetchEmployees()
    }

    func fetchEmployees() {
        guard let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees.json") else {
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            guard let data = data else {
                if let error = error {
                    print("Error fetching data: \(error)")
                }
                return
            }

            do {
                let decodedData = try JSONDecoder().decode([Employee].self, from: data)
                DispatchQueue.main.async {
                    self?.employees = decodedData
                    self?.isDataLoaded = true // Update isDataLoaded when data is loaded
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }

    func filterSearchResults() {
        searchResults = employees.filter {
            $0.fullName.localizedCaseInsensitiveContains(searchTerm)
        }
    }

    func addRandomEmployee() {
        // Add random employee functionality if needed
    }

    func deleteEmployees(offset: IndexSet) {
        employees.remove(atOffsets: offset)
    }

    func moveEmployees(from: IndexSet, to: Int) {
        employees.move(fromOffsets: from, toOffset: to)
    }
}
