import UIKit

class GlutenDairyFreeView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var breakfastCollectionView: UICollectionView!
    @IBOutlet weak var lunchCollectionView: UICollectionView!
    @IBOutlet weak var dinnerCollectionView: UICollectionView!
    
    let breakfastLabels = ["Indian scrambled eggs", "Eggs & potatoes", "Vegan fry-up", "Protein pancakes", "Kiwi fruit smoothie"]
    let lunchLabels = ["Cherry Tomato Salad", "Lemon Rice Salad", "Chickpea curry", "Healthy tuna lettuce wraps", "Chilli & avocado salsa sweet potatoes"]
    let dinnerLabels = ["Green masala butternut squash curry", "Salmon & leek parcel", "Chilli & avocado salsa sweet potatoes", "Roasted cauliflower & cashew sauce", "Caponata pasta"]
    
    var breakfastItems = [[String: String]]()
    var lunchItems = [[String: String]]()
    var dinnerItems = [[String: String]]()
    
    func loadPlistData(filename: String) -> [[String: String]] {
        if let path = Bundle.main.path(forResource: filename, ofType: "plist"),
           let array = NSArray(contentsOfFile: path) as? [[String: String]] {
            return array
        }
        return []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        breakfastItems = loadPlistData(filename: "GlutenDairyBreakfast")
        lunchItems = loadPlistData(filename: "GlutenDairyLunch")
        dinnerItems = loadPlistData(filename: "GlutenDairyDinner")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detail = segue.destination as? RecipeForNothing {
            if let indexPath = breakfastCollectionView?.indexPath(for: sender as? UICollectionViewCell) {
                let breakfastItem = breakfastItems[indexPath.row]
                detail.sentData1 = breakfastItem["Title"]
                detail.sentData2 = breakfastItem["Recipe"]
                detail.sentData3 = breakfastItem["Image"]
                detail.sentData4 = breakfastItem["Description"]
            } else if let indexPath = lunchCollectionView?.indexPath(for: sender as? UICollectionViewCell) {
                let lunchItem = lunchItems[indexPath.row]
                detail.sentData1 = lunchItem["Title"]
                detail.sentData2 = lunchItem["Recipe"]
                detail.sentData3 = lunchItem["Image"]
                detail.sentData4 = lunchItem["Description"]
            } else if let indexPath = dinnerCollectionView?.indexPath(for: sender as? UICollectionViewCell) {
                let dinnerItem = dinnerItems[indexPath.row]
                detail.sentData1 = dinnerItem["Title"]
                detail.sentData2 = dinnerItem["Recipe"]
                detail.sentData3 = dinnerItem["Image"]
                detail.sentData4 = dinnerItem["Description"]
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == breakfastCollectionView {
            return breakfastItems.count
        } else if collectionView == lunchCollectionView {
            return lunchItems.count
        } else {
            return dinnerItems.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == breakfastCollectionView {
            let breakfastCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BreakfastCell", for: indexPath) as! GlutenFreeImageCollectionView
            let breakfastItem = breakfastItems[indexPath.row]
            breakfastCell.glutenDairyBreakfastTextLabel.text = breakfastLabels[indexPath.row]
            breakfastCell.glutenDairyBreakfastImage.image = UIImage(named: breakfastItem["Image"]!)
            breakfastCell.layer.borderColor = UIColor.lightGray.cgColor
            breakfastCell.layer.borderWidth = 0.5
            return breakfastCell
        } else if collectionView == lunchCollectionView {
            let lunchCell = collectionView.dequeueReusableCell(withReuseIdentifier: "LunchCell", for: indexPath) as! GlutenFreeImageCollectionView
            let lunchItem = lunchItems[indexPath.row]
            lunchCell.glutenDairyLunchTextLabel.text = lunchLabels[indexPath.row]
            lunchCell.glutenDairyLunchImage.image = UIImage(named: lunchItem["Image"]!)
            lunchCell.layer.borderColor = UIColor.lightGray.cgColor
            lunchCell.layer.borderWidth = 0.5
            return lunchCell
        } else {
            let dinnerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DinnerCell", for: indexPath) as! GlutenFreeImageCollectionView
            let dinnerItem = dinnerItems[indexPath.row]
            dinnerCell.glutenDairyDinnerTextLabel.text = dinnerLabels[indexPath.row]
            dinnerCell.glutenDairyDinnerImage.image = UIImage(named: dinnerItem["Image"]!)
            dinnerCell.layer.borderColor = UIColor.lightGray.cgColor
            dinnerCell.layer.borderWidth = 0.5
            return dinnerCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == breakfastCollectionView {
            let breakfastCell = collectionView.cellForItem(at: indexPath)
            breakfastCell?.layer.borderColor = UIColor.lightGray.cgColor
            breakfastCell?.layer.borderWidth = 0.5
        } else if collectionView == lunchCollectionView {
            let lunchCell = collectionView.cellForItem(at: indexPath)
            lunchCell?.layer.borderColor = UIColor.lightGray.cgColor
            lunchCell?.layer.borderWidth = 0.5
        } else if collectionView == dinnerCollectionView {
            let dinnerCell = collectionView.cellForItem(at: indexPath)
            dinnerCell?.layer.borderColor = UIColor.lightGray.cgColor
            dinnerCell?.layer.borderWidth = 0.5
        }
    }
}
