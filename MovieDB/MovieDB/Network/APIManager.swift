import Foundation

protocol APIManaging {
    func sendRequest<T: Decodable>(for request: APIRequest<T>, completion: @escaping (Result<T, APIError>) -> Void)
}

enum APIError: Error {
    case networkError
    case parsingError
}

final class APIManager: APIManaging {
    
    private let urlSession: URLSession
    private let host = "https://api.themoviedb.org/3"
    private let apiKey = ""
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func sendRequest<T: Decodable>(for request: APIRequest<T>, completion: @escaping (Result<T, APIError>) -> Void) {
        
        urlSession.dataTask(with: urlRequest(from: request)) { responseData, response, _ in
            if let data = responseData {
                let response: T
                do {
                    response = try JSONDecoder().decode(T.self, from: data)
                } catch {
                    completion(.failure(.parsingError))
                    return
                }
                
                completion(.success(response))
            } else {
                completion(.failure(.networkError))
            }
        }.resume()
    }
    
    private func urlRequest<T>(from request: APIRequest<T>) -> URLRequest {
        let url = URL(host, apiKey, request)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        return urlRequest
    }
    
}

extension URL {
    func url(with queryItems: [URLQueryItem]) -> URL {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)!
        components.queryItems = (components.queryItems ?? []) + queryItems
        return components.url!
    }
    
    init<T>(_ host: String, _ apiKey: String, _ request: APIRequest<T>) {
        let queryItems = [ ("api_key", apiKey) ]
            .map { name, value in URLQueryItem(name: name, value: "\(value)") }
        
        let url = URL(string: host)!
            .appendingPathComponent(request.path)
            .url(with: queryItems)
        
        self.init(string: url.absoluteString)!
    }
}

