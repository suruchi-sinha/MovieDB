import Foundation
import UIKit

protocol MovieCoordinatorDelegate: AnyObject {
    func launchMovieDetails(for selectedMovie: Movie)
}

final class MovieCoordinator: NSObject, Coordinator {
    var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = []
    
    weak var navigationController: UINavigationController?
    private let apiManager: APIManaging
    
    init(navigationController: UINavigationController?,
         apiManager: APIManaging = APIManager()) {
        self.navigationController = navigationController
        self.apiManager = apiManager
    }
    
    func start() {
        let viewModel = MovieListViewModel(apiManager: apiManager)
        let viewController = MovieListViewController(viewModel: viewModel, delegate: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension MovieCoordinator: MovieCoordinatorDelegate {
    
    func launchMovieDetails(for selectedMovie: Movie) {
        let viewModel = MovieDetailsViewModel(movie: selectedMovie, apiManager: apiManager)
        let viewController = MovieDetailsViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
