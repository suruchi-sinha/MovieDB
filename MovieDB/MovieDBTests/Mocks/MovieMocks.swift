@testable import MovieDB
import Foundation

class MovieListViewModelDisplayableMock: MovieListViewModelDisplayable {
    
    var delegate: MovieListDelegate?
    var fetchedMovieList: Bool = false
    
    func fetchMovieList() {
        fetchedMovieList = true
    }
    
    var movies: [Movie] = []
}

class MovieListDelegateMock: MovieListDelegate {
    
    var didReceiveResponseCalled = false
    var didReceiveErrorCalled = false
    
    func didReceiveResponse() {
        didReceiveResponseCalled = true
    }
    
    func didReceiveError() {
        didReceiveErrorCalled = true
    }
}

class MovieCoordinatorDelegateMock: MovieCoordinatorDelegate {
    
    var didCallToLaunchMovieDetails = false
    
    func launchMovieDetails(for selectedMovie: Movie) {
        didCallToLaunchMovieDetails = true
    }
}

class MovieDetailsViewModelDisplayableMock: MovieDetailsViewModelDisplayable {
    
    var title: String = "title"
    var movieDetails: MovieDetails?
    var fetchedMovieDetails = false
    
    func fetchMovieDetails(completion: @escaping (MovieDetails?) -> Void) {
        fetchedMovieDetails = true
        completion(movieDetails)
    }
}
