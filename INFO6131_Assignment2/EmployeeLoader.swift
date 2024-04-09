//
//  EmployeeLoader.swift
//  INFO6131_Assignment2
//
//  Created by Shaelyn Strong on 2024-04-09.
//

import Foundation

class EmployeeLoader {
    func fetchEmployees(completion: @escaping (Result<[Employee], Error>) -> Void) {
        guard let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees.json") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let employees = try decoder.decode([Employee].self, from: data)
                completion(.success(employees))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

