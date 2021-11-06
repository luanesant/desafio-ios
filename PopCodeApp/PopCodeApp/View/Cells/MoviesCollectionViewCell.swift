import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup(movie: Movie) {
        titleLabel.text = movie.original_title
        APIMoviesRepository().getImage(imageView: posterImage,
                 url: "https://image.tmdb.org/t/p/original/\(movie.backdrop_path ?? "")")
    }
}
