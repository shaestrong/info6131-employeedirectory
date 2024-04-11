//
//  EmployeeDetail.swift
//  EmployeeDirectory
//
//  Created by Shaelyn Strong on 2024-04-10.
//

import SwiftUI

struct EmployeeDetailView: View {
    var employee: Employee
    
    var body: some View {
        VStack {
            Text("Employee Details:")
            Text("Full Name: \(employee.fullName)")
            Text("Phone Number: \(employee.phoneNumber)")
            Text("Email Address: \(employee.emailAddress)")
            Text("Biography: \(employee.biography)")
        }
    }
}
