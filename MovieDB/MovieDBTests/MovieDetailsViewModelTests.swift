@testable import MovieDB
import XCTest

final class MovieDetailsViewModelTests: XCTestCase {
    
    private let waitTime: TimeInterval = 5

    func testFetchMovieDetailsReturnsDetailsWhenSuccess() {
        let expectation = expectation(description: "Completion block is called")
        let apiManagerMock = APIManagingMock<MovieDetails>()
        let result = MovieDetails(title: "Title", overview: "Test Overview", backdropPath: "https://emaple.com/image.png")
        apiManagerMock.result = result
        
        let viewModel = MovieDetailsViewModel(movie: Movie(id: 1, title: "Title", overview: "Test Overview", posterPath: nil),
                                              apiManager: apiManagerMock)
        viewModel.fetchMovieDetails { details in
            XCTAssertEqual(details?.title, result.title)
            XCTAssertEqual(details?.overview, result.overview)
            XCTAssertEqual(details?.backdropPath, result.backdropPath)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: waitTime)
    }
    
    func testFetchMovieDetailsReturnsNilWhenFailure() {
        let expectation = expectation(description: "Completion block is called")
        let apiManagerMock = APIManagingMock<MovieDetails>()
        let viewModel = MovieDetailsViewModel(movie: Movie(id: 1, title: "Title", overview: "Test Overview", posterPath: nil),
                                              apiManager: apiManagerMock)
        viewModel.fetchMovieDetails { result in
            XCTAssertNil(result)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: waitTime)
    }

}
