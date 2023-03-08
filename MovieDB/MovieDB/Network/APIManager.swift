import Foundation

protocol APIManaging {
    func execute<T: Decodable>(_ request: APIRequest<T>, completion: @escaping (Result<T, APIError>) -> Void)
}

enum APIError: Error {
    case networkError
    case parsingError
}

final class APIManager: APIManaging {
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func execute<T: Decodable>(_ request: APIRequest<T>, completion: @escaping (Result<T, APIError>) -> Void) {
        urlSession.dataTask(with: <#T##URLRequest#>) { data, response, error in
            <#code#>
        }.resume()
    }
    
    private func urlRequest<T>(from request: APIRequest<T>) -> URLRequest {
        
    }
    
}

extension URL {
    
}
