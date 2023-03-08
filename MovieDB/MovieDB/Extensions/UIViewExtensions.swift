import UIKit

extension UIStackView {
    
    func autoLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
