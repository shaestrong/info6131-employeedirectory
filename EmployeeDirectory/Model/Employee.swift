//
//  Employee.swift
//  EmployeeDirectory
//
//  Created by Shaelyn Strong on 2024-04-10.
//

import Foundation

struct Employee: Identifiable, Decodable {
    let id: UUID
    let fullName: String
    let phoneNumber: String
    let emailAddress: String
    let biography: String
    let photoURLSmall: URL
    let photoURLLarge: URL
    let team: String
    let employeeType: String
    
    // Computed Properties
    var imageName: String { fullName }
    var thumbnailName: String { return fullName + "Thumb"}
    
    init(id: UUID = UUID(), fullName: String, phoneNumber: String, emailAddress: String, biography: String, photoURLSmall: URL, photoURLLarge: URL, team: String, employeeType: String) {
        self.id = id
        self.fullName = fullName
        self.phoneNumber = phoneNumber
        self.emailAddress = emailAddress
        self.biography = biography
        self.photoURLSmall = photoURLSmall
        self.photoURLLarge = photoURLLarge
        self.team = team
        self.employeeType = employeeType
    }
}

extension Employee: Equatable {
    static func == (lhs: Employee, rhs: Employee) -> Bool {
        // Implement your equality comparison logic here
        return lhs.id == rhs.id // Assuming `id` is a unique identifier for an employee
    }
}
