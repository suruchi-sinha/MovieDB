@testable import MovieDB
import XCTest

final class ParserTests: XCTestCase {
    
    func testMovieListIsParsedCorrectly() throws {
        let jsonData = readJSON(for: "movie_list")!
        let parsedData = try? JSONDecoder().decode(List<Movie>.self, from: jsonData)
        if let parsedData {
            XCTAssertEqual(parsedData.results.count, 20)
            XCTAssertEqual(parsedData.results.first?.title, "The Shawshank Redemption")
            XCTAssertEqual(parsedData.results.first?.id, 278)
        } else {
            XCTFail("Movie List parsing failed")
        }
    }
    
    func testMoveDetailsParsedCorrectly() {
        let jsonData = readJSON(for: "movie_details")!
        let parsedData = try? JSONDecoder().decode(MovieDetails.self, from: jsonData)
        if let parsedData {
            XCTAssertEqual(parsedData.title, "Fight Club")
            XCTAssertEqual(parsedData.overview, "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.")
            XCTAssertEqual(parsedData.backdropPath, "/fCayJrkfRaCRCTh8GqN30f8oyQF.jpg")
        } else {
            XCTFail("Movie Details parsing failed")
        }
    }
    
    private func readJSON(for name: String) -> Data? {
        let bundle = Bundle(for: type(of: self))
        if let url = bundle.url(forResource: name, withExtension: "json") {
            let data = try? Data(contentsOf: url)
            return data
        }
        return nil
    }

}
