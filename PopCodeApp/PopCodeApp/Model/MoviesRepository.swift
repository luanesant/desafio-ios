import Foundation

protocol MoviesRepository {
    func getMovies() -> [Movie]
}
