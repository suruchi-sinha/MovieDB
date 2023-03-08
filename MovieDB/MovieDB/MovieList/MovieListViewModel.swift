import Foundation

protocol MovieListViewModelDisplayable {
    var movies: [Movie] { set get }
    var delegate: MovieListViewControllerDelegate? { get set }
    func fetchMovieList()
}

final class MovieListViewModel: MovieListViewModelDisplayable {
    
    var movies: [Movie] = [] {
        didSet {
            delegate?.didReceiveResponse()
        }
    }
    
    weak var delegate: MovieListViewControllerDelegate?
    private let apiManager: APIManaging
    
    init(apiManager: APIManaging = APIManager()) {
        self.apiManager = apiManager
    }
    
    func fetchMovieList() {
        apiManager.sendRequest(for: Movie.topRated) { [weak self] apiResponse in
            switch apiResponse {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.movies = response.results
                }
            case .failure:
                DispatchQueue.main.async {
                    self?.delegate?.didReceiveError()
                }
            }
        }
    }
}
