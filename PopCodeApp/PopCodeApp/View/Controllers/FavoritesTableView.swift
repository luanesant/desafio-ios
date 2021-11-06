
import UIKit

class FavoritesTableView: UITableView {

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        register(UINib(nibName: "FavoritesTableViewCell",
                       bundle: nil),
                 forCellReuseIdentifier: "tableCell")
        
        dataSource = self
        delegate = self
    }
    
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return self.contentSize
    }
    
    override var contentSize: CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }
}

extension FavoritesTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 6
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! FavoritesTableViewCell
        
       
        return cell
    }
}

extension FavoritesTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        appointmentsDelegate?.didSelectRow(indexPath.row)
    }

}
