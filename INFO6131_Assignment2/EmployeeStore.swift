import Foundation
import Observation

@Observable
final class EmployeeStore {
    var employees: [Employee]
    
    init(employees: [Employee] = []) {
        self.employees = employees
    }
    
    func fetchEmployees(completion: @escaping (Result<Void, Error>) -> Void) {
        guard let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees.json") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            
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
                
                // Update the employees property
                self.employees = employees
                
                completion(.success(()))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
