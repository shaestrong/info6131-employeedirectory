//
//  EmployeeListView.swift
//  EmployeeDirectory
//
//  Created by Shaelyn Strong on 2024-04-10.
//
import SwiftUI

struct EmployeeListView: View {
    @State var viewModel: EmployeeListViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.listData) { employee in
                    EmployeeRow(employee: employee)
                }
                .onMove(perform: viewModel.moveEmployees)
                .onDelete(perform: viewModel.deleteEmployees)
                
                HStack {
                    Spacer()
                    Text(viewModel.displayCount)
                        .foregroundStyle(.secondary)
                    Spacer()
                }
            }
            .navigationTitle("Employees") // Set a default navigation title
            .searchable(text: $viewModel.searchTerm, prompt: "Search for Employees")
            .onChange(of: viewModel.searchTerm) { newSearchTerm, _ in
                viewModel.filterSearchResults()
            }
            .onChange(of: viewModel.employees) { newEmployees, _ in
                // Handle changes to the employees array
                // For example, you can update the UI or perform additional tasks
            }
        }
    }
}
