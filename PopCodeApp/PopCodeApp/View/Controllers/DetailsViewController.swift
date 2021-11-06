
import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    
    var detailsViewModel: DetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        titleLabel.text = detailsViewModel.title
        synopsisLabel.text = detailsViewModel.overview
        APIMoviesRepository().getImage(imageView: posterImage,
                                       url: "https://image.tmdb.org/t/p/original/\(detailsViewModel.movie.backdrop_path ?? "")")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.tabBarController?.tabBar.isHidden = false
    }
}
