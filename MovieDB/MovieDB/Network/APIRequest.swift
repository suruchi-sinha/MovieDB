import Foundation

enum RequestMethod: String {
    case get = "GET"
}

struct APIRequest<T> {
    
    let method: RequestMethod
    let path: String
    
    init(method: RequestMethod = .get, path: String) {
        self.method = method
        self.path = path
    }
}
