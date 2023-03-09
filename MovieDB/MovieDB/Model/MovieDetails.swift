import Foundation

struct MovieDetails: Decodable {
    
    let title: String
    let overview: String
    let backdropPath: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case backdropPath = "backdrop_path"
    }
}

extension MovieDetails {
    static func details(for movieID: Int) -> APIRequest<MovieDetails> {
        return APIRequest(method: .get, path: "/movie/\(movieID)")
    }
}
