//
//  EmployeeRow.swift
//  EmployeeDirectory
//
//  Created by Shaelyn Strong on 2024-04-10.
//

import SwiftUI

struct EmployeeRow: View {
    var employee: Employee
    
    var body: some View {
        NavigationLink(destination: EmployeeDetailView(employee: employee)) {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 75, height: 75)
                
                VStack(alignment: .leading) {
                    Text(employee.fullName)
                        .font(.title2)
                        .foregroundColor(.black)
                    Text("Some additional details here") // Replace with actual details
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding()
        }
    }
}
