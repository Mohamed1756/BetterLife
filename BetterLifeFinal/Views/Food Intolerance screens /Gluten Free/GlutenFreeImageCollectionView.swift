import UIKit

class GlutenFreeImageCollectionView: UICollectionViewCell {
    // MARK: Gluten Basic Views
    @IBOutlet weak var glutenBasicBreakfastImage: UIImageView!
    @IBOutlet weak var glutenBasicLunchImage: UIImageView!
    @IBOutlet weak var glutenBasicDinnerImage: UIImageView!
    
    @IBOutlet weak var glutenBasicBreakfastTextLabel: UILabel!
    @IBOutlet weak var glutenBasicLunchTextLabel: UILabel!
    @IBOutlet weak var glutenBasicDinnerTextLabel: UILabel!
    
    // MARK: Dairy Free Views
    @IBOutlet weak var glutenDairyBreakfastImage: UIImageView!
    @IBOutlet weak var glutenDairyLunchImage: UIImageView!
    @IBOutlet weak var glutenDairyDinnerImage: UIImageView!
    
    @IBOutlet weak var glutenDairyBreakfastTextLabel: UILabel!
    @IBOutlet weak var glutenDairyLunchTextLabel: UILabel!
    @IBOutlet weak var glutenDairyDinnerTextLabel: UILabel!
}
