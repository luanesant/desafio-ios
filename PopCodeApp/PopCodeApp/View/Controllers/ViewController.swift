
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var moviesCollection: MoviesCollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup(){
        moviesCollection.setup()
        moviesCollection.collectionDelegate = self
        searchBar.delegate = self
    }
}

extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        moviesCollection.reload(text: searchBar.text ?? "")
        moviesCollection.reloadData()
    }
}
extension ViewController: MoviewColletionDelegate{
    func didShowDetails(_ withMovie: Movie) {
        let showDetailViewController = DetailsViewController(nibName: "DetailsViewController", bundle: nil)
        showDetailViewController.detailsViewModel = DetailsViewModel(movie: withMovie)
        self.navigationController?.pushViewController(showDetailViewController, animated: true)
    }
}

