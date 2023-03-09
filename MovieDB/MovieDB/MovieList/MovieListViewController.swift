import UIKit

protocol MovieListDelegate: AnyObject {
    func didReceiveResponse()
    func didReceiveError()
}

final class MovieListViewController: UITableViewController, MovieListDelegate {
    
    private var viewModel: MovieListViewModelDisplayable
    
    private weak var delegate: MovieCoordinatorDelegate?

    init(viewModel: MovieListViewModelDisplayable,
         delegate: MovieCoordinatorDelegate?) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Top Movies"
        viewModel.delegate = self
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.defaultIndentifier)
        tableView.rowHeight = UITableView.automaticDimension
        viewModel.fetchMovieList()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.defaultIndentifier) as! MovieCell
        let movie = viewModel.movies[indexPath.row]
        cell.configureCell(with: movie)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.movies[indexPath.row]
        delegate?.launchMovieDetails(for: movie)
    }
    
    func didReceiveResponse() {
        tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
    
    func didReceiveError() {
        
    }

}
