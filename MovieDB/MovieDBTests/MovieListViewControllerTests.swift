@testable import MovieDB
import XCTest

final class MovieListViewControllerTests: XCTestCase {

    func testViewDidLoadFetchesMovieList() {
        let viewModel = MovieListViewModelDisplayableMock()
        let viewController = MovieListViewController(viewModel: viewModel, delegate: MovieCoordinatorDelegateMock())
        
        XCTAssertFalse(viewModel.fetchedMovieList)
        viewController.viewDidLoad()
        XCTAssertTrue(viewModel.fetchedMovieList)
    }
}
