import Foundation
import UIKit

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
        let viewController = MovieListViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
