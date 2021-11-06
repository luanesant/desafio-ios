
import UIKit

protocol MoviewColletionDelegate {
    func didShowDetails(_ withMovie: Movie)
}

class MoviesCollectionView: UICollectionView {

    private var movies: [Movie] = []
    private var filterMovies: [Movie] = []
    private var repository = MovieService()
    
    var collectionDelegate: MoviewColletionDelegate?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        register(UINib(nibName: "MoviesCollectionViewCell",
                       bundle: nil),
                 forCellWithReuseIdentifier: "cell")
        
        
        dataSource = self
        delegate = self
        backgroundColor = .clear
    }
    
    func setup(){
        movies = repository.getMovies()
        filterMovies = movies
    }
    
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return self.contentSize
    }
    
    override  var contentSize: CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    func reload(text: String) {
            if  text != "" {
                filterMovies = self.movies.filter({$0.original_title.hasPrefix(text)})
            } else {
                filterMovies = movies
            }
        }
}

extension MoviesCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterMovies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MoviesCollectionViewCell
        cell.setup(movie: filterMovies[indexPath.row])

        return cell
    }
}

extension MoviesCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        collectionDelegate?.didShowDetails(filterMovies[indexPath.row])
    }
}
