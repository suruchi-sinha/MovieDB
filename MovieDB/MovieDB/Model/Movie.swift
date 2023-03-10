import Foundation

struct Movie: Decodable {
    
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
    }
}

extension Movie {
    static var topRated: APIRequest<MovieList<Movie>> {
        return APIRequest(method: .get, path: "/movie/top_rated")
    }
}
