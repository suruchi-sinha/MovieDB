import UIKit

extension UIFont {
    
    enum Heading {
        static let medium = UIFont.systemFont(ofSize: 28, weight: .semibold)
        static let small = UIFont.systemFont(ofSize: 22, weight: .semibold)
    }
    
    enum Body {
        static let small: UIFont = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
}

extension UIColor {
    
    enum Text {
        static let primary: UIColor = UIColor.darkGray
        static let secondary: UIColor = UIColor.gray
        static let white: UIColor = UIColor.white
    }
    
    enum Background {
        static let darkGray: UIColor = UIColor.darkGray
    }
}

extension UITableViewCell {
    static var defaultIndentifier: String {
         return String(describing: self)
    }
}
