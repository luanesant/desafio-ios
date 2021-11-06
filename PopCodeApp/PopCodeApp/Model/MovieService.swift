//
//  MovieService.swift
//  PopCodeApp
//
//  Created by Gustavo Anjos on 06/11/21.
//

import Foundation

final class MovieService {

    var repository: MoviesRepository

    init(repository: MoviesRepository = APIMoviesRepository()) {
        self.repository = repository
    }

    func getMovies() -> [Movie] {
        return self.repository.getMovies()
    }
}
