import Foundation
import UIKit

final class MovieCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let movieImageView = UIImageView()
    private let textStackView = UIStackView()
    private let containerStackView = UIStackView()
    
    private let imageSize = CGSize(width: 90.0, height: 120.0)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContentView()
        setupConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupContentView() {
        layoutMargins = UIEdgeInsets(top: CGFloat.Spacing.two, left: CGFloat.Spacing.two, bottom: CGFloat.Spacing.two, right: CGFloat.Spacing.two)
        
        titleLabel.font = UIFont.Heading.small
        titleLabel.textColor = UIColor.Text.darkGray
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        
        descriptionLabel.font = UIFont.Body.small
        descriptionLabel.textColor = UIColor.Text.gray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        
        movieImageView.contentMode = .scaleAspectFit
        movieImageView.layer.cornerRadius = 8
        movieImageView.layer.masksToBounds = true
        
        textStackView.alignment = .leading
        textStackView.axis = .vertical
        textStackView.spacing = CGFloat.Spacing.half
        
        containerStackView.autoLayout()
        containerStackView.spacing = CGFloat.Spacing.two
        containerStackView.alignment = .top
        
        textStackView.addArrangedSubviews([titleLabel, descriptionLabel])
        containerStackView.addArrangedSubviews([movieImageView, textStackView])
        contentView.addSubview(containerStackView)
    }
    
    private func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(containerStackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor))
        constraints.append(containerStackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor))
        constraints.append(containerStackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor))
        constraints.append(containerStackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor))
        
        constraints.append(movieImageView.widthAnchor.constraint(equalToConstant: imageSize.width))
        constraints.append(movieImageView.heightAnchor.constraint(equalToConstant: imageSize.height))
    }
}
