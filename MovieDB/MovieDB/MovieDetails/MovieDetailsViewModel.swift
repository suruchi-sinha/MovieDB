import Foundation

protocol MovieDetailsViewModelDisplayable {
    var title: String { get }
    func fetchMovieDetails(completion: @escaping (MovieDetails?) -> Void)
}

final class MovieDetailsViewModel: MovieDetailsViewModelDisplayable {
    
    private let movie: Movie
    private let apiManager: APIManaging
    private var movieDetails: MovieDetails?
    
    var title: String {
        return movie.title
    }
    
    init(movie: Movie,
         apiManager: APIManaging = APIManager()) {
        self.movie = movie
        self.apiManager = apiManager
    }
    
    func fetchMovieDetails(completion: @escaping (MovieDetails?) -> Void) {
        apiManager.sendRequest(for: MovieDetails.details(for: movie.id)) { [weak self] response in
            switch response {
            case .success(let movieDetails):
                DispatchQueue.main.async {
                    self?.movieDetails = movieDetails
                    completion(movieDetails)
                }
            case .failure:
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}
