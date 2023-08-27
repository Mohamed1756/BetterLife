import UIKit

class imageCollectionView: UICollectionViewCell {
    // MARK: Common Properties
    @IBOutlet weak var imgImage: UIImageView!
    
    // MARK: Breakfast Properties
    @IBOutlet weak var breakfastTextLabel: UILabel!
    
    // MARK: Lunch Properties
    @IBOutlet weak var lunchImage: UIImageView!
    @IBOutlet weak var lunchTextLabel: UILabel!
    
    // MARK: Dinner Properties
    @IBOutlet weak var dinnerImage: UIImageView!
    @IBOutlet weak var dinnerTextLabel: UILabel!
    
    // MARK: Eggs Intolerance Properties
    @IBOutlet weak var eggsBreakfastImage: UIImageView!
    @IBOutlet weak var eggsBreakfastTextLabel: UILabel!
    
    @IBOutlet weak var eggsLunchImage: UIImageView!
    @IBOutlet weak var eggsLunchTextLabel: UILabel!
    
    @IBOutlet weak var eggsDinnerImage: UIImageView!
    @IBOutlet weak var eggsDinnerTextLabel: UILabel!
    
    // MARK: Fish Intolerance Properties
    @IBOutlet weak var fishBreakfastImage: UIImageView!
    @IBOutlet weak var fishBreakfastTextLabel: UILabel!
    
    @IBOutlet weak var fishLunchImage: UIImageView!
    @IBOutlet weak var fishLunchTextLabel: UILabel!
    
    @IBOutlet weak var fishDinnerImage: UIImageView!
    @IBOutlet weak var fishDinnerTextLabel: UILabel!
    
    // MARK: Dairy Intolerance Properties
    @IBOutlet weak var dairyBreakfastImage: UIImageView!
    @IBOutlet weak var dairyBreakfastTextLabel: UILabel!
    
    @IBOutlet weak var dairyLunchImage: UIImageView!
    @IBOutlet weak var dairyLunchTextLabel: UILabel!
    
    @IBOutlet weak var dairyDinnerImage: UIImageView!
    @IBOutlet weak var dairyDinnerTextLabel: UILabel!
}
