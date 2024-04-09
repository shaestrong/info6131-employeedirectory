//
//  Employee.swift
//  INFO6131_Assignment2
//
//  Created by Shaelyn Strong on 2024-04-09.
//


import Foundation

struct Employee: Identifiable, Decodable {
    let id: UUID
    let fullName: String
    let phoneNumber: String
    let emailAddress: String
    let biography: String
    let photoURLSmall: String
    let photoURLLarge: String
    let team: String
    let employeeType: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case fullName = "full_name"
        case phoneNumber = "phone_number"
        case emailAddress = "email_address"
        case biography
        case photoURLSmall = "photo_url_small"
        case photoURLLarge = "photo_url_large"
        case team
        case employeeType = "employee_type"
    }
}
