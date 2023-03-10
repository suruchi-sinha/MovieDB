@testable import MovieDB
import XCTest

final class APITests: XCTestCase {
    func testURLQueryParams() {
        let queryItem = URLQueryItem(name: "testName", value: "testValue")
        let url = URL(string: "https://example.com")!.url(with: [queryItem])
        XCTAssertEqual(url.absoluteString, "https://example.com?testName=testValue")
    }
    
    func testFullURLBuilder() {
        let request: APIRequest<Movie> = APIRequest(method: .get, path: "/testing")
        let url = URL("https://example.com", "testKey", request)
        XCTAssertEqual(url.absoluteString, "https://example.com/testing?api_key=testKey")
    }
}
