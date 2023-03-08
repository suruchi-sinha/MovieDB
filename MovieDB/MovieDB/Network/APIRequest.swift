import Foundation

enum APIMethod: String {
    case get = "GET"
}

struct APIRequest<T> {
    
    let method: APIMethod
    let path: String
    
    init(method: APIMethod = .get, path: String) {
        self.method = method
        self.path = path
    }
}
