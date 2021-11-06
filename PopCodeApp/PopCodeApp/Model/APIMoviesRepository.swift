import Foundation
import UIKit

class APIMoviesRepository: MoviesRepository {
    func getMovies() -> [Movie] {
        let stringURL: String = "https://api.themoviedb.org/3/movie/popular?api_key=ad9408b6ab6ea7841f75c62d89c765ad"

    
        guard let url: URL = URL(string: stringURL),
              let data = try? Data(contentsOf: url) else { return [] }
        
        if let result: Movies = try? JSONDecoder().decode(Movies.self, from: data) {
            var movies: [Movie] = []
            
            result.results.forEach { movie in
                movies.append(.init(poster_path: movie.poster_path,
                                    adult: movie.adult,
                                    overview: movie.overview,
                                    release_date: movie.release_date,
                                    genre_ids: movie.genre_ids,
                                    id: movie.id,
                                    original_title: movie.original_title,
                                    original_language: movie.original_language,
                                    title: movie.title,
                                    backdrop_path: movie.backdrop_path,
                                    popularity: movie.popularity,
                                    vote_count: movie.vote_count,
                                    video: movie.video,
                                    vote_average: movie.vote_average))
                
            }
            return movies
        }
        
        return []
    }
    
    func getImage(imageView: UIImageView, url: String) {
        let url = URL(string: url)!

            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        imageView.image = UIImage(data: data)
                    }
                }
            }
    }
}
