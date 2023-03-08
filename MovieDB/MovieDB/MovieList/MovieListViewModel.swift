import Foundation

final class MovieListViewModel {
    
    private let apiManager: APIManaging
    
    init(apiManager: APIManaging = APIManager()) {
        self.apiManager = apiManager
    }
    
    func fetchMovieList() {
        
    }
    
}
