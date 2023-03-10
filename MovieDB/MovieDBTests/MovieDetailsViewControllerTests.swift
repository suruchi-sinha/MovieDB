@testable import MovieDB
import XCTest

final class MovieDetailsViewControllerTests: XCTestCase {

    func testViewDidLoadFetchesMovieDetails() {
        let viewModel = MovieDetailsViewModelDisplayableMock()
        let viewController = MovieDetailsViewController(viewModel: viewModel)
        
        XCTAssertFalse(viewModel.fetchedMovieDetails)
        viewController.viewDidLoad()
        XCTAssertTrue(viewModel.fetchedMovieDetails)
    }

}
