import UIKit

final class MovieDetailsViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let backdropImageView = UIImageView()
    private let titleLabel = UILabel()
    private let overviewLabel = UILabel()
    private let contentStackView = UIStackView()
    private let viewModel: MovieDetailsViewModelDisplayable
    
    init(viewModel: MovieDetailsViewModelDisplayable) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        navigationItem.largeTitleDisplayMode = .never
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        setupView()
        setupConstraints()
        viewModel.fetchMovieDetails { [weak self] details in
            DispatchQueue.main.async {
                self?.configureView(with: details)
            }
        }
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        backdropImageView.contentMode = .scaleAspectFill
        backdropImageView.clipsToBounds = true
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.font = UIFont.Heading.medium
        titleLabel.textColor = UIColor.Text.primary
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.setContentHuggingPriority(.required, for: .vertical)
        
        overviewLabel.font = UIFont.Body.small
        overviewLabel.textColor = UIColor.Text.secondary
        overviewLabel.numberOfLines = 0
        overviewLabel.lineBreakMode = .byWordWrapping
        
        contentStackView.axis = .vertical
        contentStackView.spacing = CGFloat.Spacing.three
        contentStackView.setCustomSpacing(CGFloat.Spacing.one, after: titleLabel)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        contentStackView.addArrangedSubviews([backdropImageView, titleLabel, overviewLabel])
        scrollView.addSubview(contentStackView)
    }
    
    private func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(scrollView.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        constraints.append(scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        
        constraints.append(backdropImageView.heightAnchor.constraint(equalTo: backdropImageView.widthAnchor, multiplier: 11 / 16, constant: 0))
        
        constraints.append(contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: CGFloat.Spacing.three))
        constraints.append(contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.Spacing.two))
        constraints.append(contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -CGFloat.Spacing.two))
        constraints.append(contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -CGFloat.Spacing.three))
        NSLayoutConstraint.activate(constraints)
        
        scrollView.layoutMargins = UIEdgeInsets(top: CGFloat.Spacing.three,
                                                left: CGFloat.Spacing.two,
                                                bottom: CGFloat.Spacing.three,
                                                right: CGFloat.Spacing.two)
    }

    private func configureView(with movieDetails: MovieDetails) {
        backdropImageView.setImage(backdropPath: movieDetails.backdropPath)
        titleLabel.text = movieDetails.title
        overviewLabel.text = movieDetails.overview
    }
}
