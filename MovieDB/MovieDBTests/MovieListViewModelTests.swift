@testable import MovieDB
import XCTest

final class MovieListViewModelTests: XCTestCase {
    
    func testSettingValueToMoviesCallsDidReceiveResponse() {
        let apiManagerMock = APIManagingMock<Movie>()
        let mockDelegate = MovieListDelegateMock()
        let viewModel = MovieListViewModel(apiManager: apiManagerMock)
        viewModel.delegate = mockDelegate
        
        XCTAssertFalse(mockDelegate.didReceiveResponseCalled)
        viewModel.movies = []
        XCTAssertTrue(mockDelegate.didReceiveResponseCalled)
    }
    
    func testFetchMovieListMakesAPIRequest() {
        let apiManagerMock = APIManagingMock<Movie>()
        let mockDelegate = MovieListDelegateMock()
        let viewModel = MovieListViewModel(apiManager: apiManagerMock)
        viewModel.delegate = mockDelegate
        
        XCTAssertFalse(apiManagerMock.requestSent)
        viewModel.fetchMovieList()
        XCTAssertTrue(apiManagerMock.requestSent)
    }

}
