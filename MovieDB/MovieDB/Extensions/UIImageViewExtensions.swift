import UIKit

extension UIImageView {
    
    func setImage(posterPath: String) {
        let imageURL = URL(string: "https://image.tmdb.org/t/p/w185/\(posterPath)")
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageURL!)
            DispatchQueue.main.async {
                guard let data = data else { return }
                self.image = UIImage(data: data)
            }
        }
    }
}
