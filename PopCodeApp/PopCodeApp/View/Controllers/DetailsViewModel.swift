import UIKit

class DetailsViewModel{
    let movie: Movie
    
    var title: String{
        return movie.original_title
    }
    
    var release_date: String{
        return movie.release_date
    }
    
    var overview: String{
        return movie.overview
    }
    
    init(movie: Movie){
        self.movie = movie
    }
}
