import UIKit

class PescatarianEggFreeView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var breakfastCollectionView: UICollectionView!
    @IBOutlet weak var lunchCollectionView: UICollectionView!
    @IBOutlet weak var dinnerCollectionView: UICollectionView!
    
    let breakfastLabels = ["Blueberry & banana power smoothie", "Homemade Muesli", "Avocado toast", "Carrot cake porridge", "Chia pudding"]
    let lunchLabels = ["Salmon & leek parcel", "Sesame salmon & sweet potato mash", "Sweet potato & avacado", "Honey & orange roast sea bass with lentils", "Fattoush Salad"]
    let dinnerLabels = ["Sweet potato curry", "Caponata pasta", "Salmon & leek parcel", "Sesame salmon & sweet potato mash", "Curried Cauliflower Soup"]
    
    var breakfastItems = [[String: String]]()
    var lunchItems = [[String: String]]()
    var dinnerItems = [[String: String]]()
   
    func pescatarianEggBreakfastPlist() -> [[String: String]] {
        let path = Bundle.main.path(forResource: "PescatarianEggBreakfast", ofType: "plist")
        return NSArray(contentsOf: URL(fileURLWithPath: path!)) as! [[String: String]]
    }
    
    func pescatarianEggLunchPlist() -> [[String: String]] {
        let path1 = Bundle.main.path(forResource: "PescatarianEggLunch", ofType: "plist")
        return NSArray(contentsOf: URL(fileURLWithPath: path1!)) as! [[String: String]]
    }
    
    func pescatarianEggDinnerPlist() -> [[String: String]] {
        let path2 = Bundle.main.path(forResource: "PescatarianEggDinner", ofType: "plist")
        return NSArray(contentsOf: URL(fileURLWithPath: path2!)) as! [[String: String]]
    }
    
    override func viewDidLoad() {
        // load Breakfast images
        self.breakfastItems = pescatarianEggBreakfastPlist()
        // load Lunch Images
        self.lunchItems = pescatarianEggLunchPlist()
        // load dinner images
        self.dinnerItems = pescatarianEggDinnerPlist()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pescEggBreakfastToRecipe" {
            let detail = segue.destination as! RecipeForNothing
            if let indexPath = self.breakfastCollectionView?.indexPath(for: sender as! UICollectionViewCell) {
                let breakfastItem = self.breakfastItems[indexPath.row]
                detail.sentData1 = breakfastItem["Title"]
                detail.sentData2 = breakfastItem["Recipe"]
                detail.sentData3 = breakfastItem["Image"]
                detail.sentData4 = breakfastItem["Description"]
            }
        } else if segue.identifier == "pescEggLunchToRecipe" {
            let detail = segue.destination as! RecipeForNothing
            if let indexPath = self.lunchCollectionView?.indexPath(for: sender as! UICollectionViewCell) {
                let lunchItem = self.lunchItems[indexPath.row]
                detail.sentData1 = lunchItem["Title"]
                detail.sentData2 = lunchItem["Recipe"]
                detail.sentData3 = lunchItem["Image"]
                detail.sentData4 = lunchItem["Description"]
            }
        } else if segue.identifier == "pescEggDinnerToRecipe" {
            let detail = segue.destination as! RecipeForNothing
            if let indexPath = self.dinnerCollectionView?.indexPath(for: sender as! UICollectionViewCell) {
                let dinnerItem = self.dinnerItems[indexPath.row]
                detail.sentData1 = dinnerItem["Title"]
                detail.sentData2 = dinnerItem["Recipe"]
                detail.sentData3 = dinnerItem["Image"]
                detail.sentData4 = dinnerItem["Description"]
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == breakfastCollectionView || collectionView == lunchCollectionView || collectionView == dinnerCollectionView {
            return 1
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == breakfastCollectionView {
            return self.breakfastItems.count
        } else if collectionView == lunchCollectionView {
            return self.lunchItems.count
        } else if collectionView == dinnerCollectionView {
            return self.dinnerItems.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == breakfastCollectionView {
            let breakfastCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BreakfastCell", for: indexPath) as! PescatarianImageCollectionView
            let breakfastItem = self.breakfastItems[indexPath.row]
            breakfastCell.pescatarianEggBreakfastTextLabel.text = breakfastLabels[indexPath.row]
            breakfastCell.pescatarianEggBreakfastImage.image = UIImage(named: breakfastItem["Image"]!)
            breakfastCell.layer.borderColor = UIColor.lightGray.cgColor
            breakfastCell.layer.borderWidth = 0.5
            return breakfastCell
        } else if collectionView == lunchCollectionView {
            let lunchCell = collectionView.dequeueReusableCell(withReuseIdentifier: "LunchCell", for: indexPath) as! PescatarianImageCollectionView
            let lunchItem = self.lunchItems[indexPath.row]
            lunchCell.pescatarianEggLunchTextLabel.text = lunchLabels[indexPath.row]
            lunchCell.pescatarianEggLunchImage.image = UIImage(named: lunchItem["Image"]!)
            lunchCell.layer.borderColor = UIColor.lightGray.cgColor
            lunchCell.layer.borderWidth = 0.5
            return lunchCell
        } else if collectionView == dinnerCollectionView {
            let dinnerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DinnerCell", for: indexPath) as! PescatarianImageCollectionView
            let dinnerItem = self.dinnerItems[indexPath.row]
            dinnerCell.pescatarianEggDinnerTextLabel.text = dinnerLabels[indexPath.row]
            dinnerCell.pescatarianEggDinnerImage.image = UIImage(named: dinnerItem["Image"]!)
            dinnerCell.layer.borderColor = UIColor.lightGray.cgColor
            dinnerCell.layer.borderWidth = 0.5
            return dinnerCell
        }
        return UICollectionViewCell()
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
