@testable import MovieDB
import Foundation

class APIManagingMock<T>: APIManaging {
    
    var result: T?
    var error: APIError = .parsingError
    var requestSent = false
    
    func sendRequest<T>(for request: MovieDB.APIRequest<T>, completion: @escaping (Result<T, APIError>) -> Void) where T : Decodable {
        requestSent = true
        if let result {
            completion(.success(result as! T))
        } else {
            completion(.failure(error))
        }
    }
}
