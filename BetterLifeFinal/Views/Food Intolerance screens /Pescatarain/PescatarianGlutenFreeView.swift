import UIKit

class PescatarianGlutenFreeView:UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var breakfastCollectionView: UICollectionView!
    
    @IBOutlet weak var lunchCollectionView: UICollectionView!
    
    @IBOutlet weak var dinnerCollectionView: UICollectionView!
    
    let breakfastLabels = ["Indian scrambled eggs", "Eggs & potatoes", "One-pan summer eggs", "Blueberry & banana power smoothie", "Homemade Muesli"]
    
    let lunchLabels = ["Honey & orange roast sea bass with lentils","Salmon & leek parcel", "Sweet potato & avacado", "Thai green curry", "Fattoush Salad"]
    
    let dinnerLabels = ["Honey & orange roast sea bass with lentils", "Salmon & leek parcel", "Chilli & avocado salsa sweet potatoes", "Caponata pasta", "Vegetarian Stuffed Peppers"]
    
    var breakfastItems = [[String:String]]()
    var lunchItems = [[String:String]]()
    var dinnerItems = [[String:String]]()
   
    func pescatarianGlutenBreakfastPlist () -> [[String:String]] {
        
        let path = Bundle.main.path(forResource: "PescatarianGlutenBreakfast", ofType: "plist")
        
        return NSArray.init(contentsOf: URL.init (fileURLWithPath: path!)) as! [[String:String]]
        
        
    }
    func pescatarianGlutenLunchPlist() -> [[String:String]] {
        
        let path1 = Bundle.main.path (forResource: "PescatarianGlutenLunch", ofType: "plist")
        
        return NSArray.init(contentsOf: URL.init (fileURLWithPath: path1!)) as! [[String:String]]
        
    }
    func pescatarianGlutenDinnerPlist() -> [[String:String]] {
        
        let path2 = Bundle.main.path (forResource: "PescatarianGlutenDinner", ofType: "plist")
        
        
        return NSArray.init(contentsOf: URL.init (fileURLWithPath: path2!)) as! [[String:String]]
    }
    override func viewDidLoad() {
        // load Breakfast images
        self.breakfastItems = pescatarianGlutenBreakfastPlist()
        // load Lunch Images
        self.lunchItems = pescatarianGlutenLunchPlist()
        // load dinner images
        self.dinnerItems = pescatarianGlutenDinnerPlist()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "pescGlutenBreakfastToRecipe" {
           
            let detail = segue.destination as! RecipeForNothing
        
            if let indexPath = self.breakfastCollectionView?.indexPath(for: sender as! UICollectionViewCell) {
                
                let breakfastItem = self.breakfastItems [indexPath.row]
           
                detail.sentData1 = breakfastItem ["Title"]
                detail.sentData2 = breakfastItem ["Recipe"]
                detail.sentData3 = breakfastItem ["Image"]
                detail.sentData4 = breakfastItem ["Description"]
            }
        }
        if segue.identifier == "pescGlutenLunchToRecipe" {
               
                let detail = segue.destination as! RecipeForNothing
            
                if let indexPath = self.lunchCollectionView?.indexPath(for: sender as! UICollectionViewCell) {
                    
                    let lunchItem = self.lunchItems[indexPath.row]
               
                    detail.sentData1 = lunchItem ["Title"]
                    detail.sentData2 = lunchItem ["Recipe"]
                    detail.sentData3 = lunchItem ["Image"]
                    detail.sentData4 = lunchItem ["Description"]
                }
        }
        if segue.identifier == "pescGlutenDinnerToRecipe" {
           
            let detail = segue.destination as! RecipeForNothing
        
            if let indexPath = self.dinnerCollectionView?.indexPath(for: sender as! UICollectionViewCell) {
                
                let dinnerItem = self.dinnerItems[indexPath.row]
           
                detail.sentData1 = dinnerItem ["Title"]
                detail.sentData2 = dinnerItem ["Recipe"]
                detail.sentData3 = dinnerItem ["Image"]
                detail.sentData4 = dinnerItem ["Description"]
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if (collectionView == breakfastCollectionView) {
            return 1
        }
        if (collectionView == lunchCollectionView) {
            return 1
        }
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == breakfastCollectionView) {
            return self.breakfastItems.count
        }
        if (collectionView == lunchCollectionView) {
            return self.lunchItems.count
        }
        return self.dinnerItems.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == breakfastCollectionView) {
            
            let breakfastCell = breakfastCollectionView.dequeueReusableCell(withReuseIdentifier: "BreakfastCell", for: indexPath) as! PescatarianImageCollectionView
            
            let breakfastItem = self.breakfastItems[indexPath.row]
            
            breakfastCell.pescatarianGlutenBreakfastTextLabel.text = breakfastLabels[indexPath.row]
            breakfastCell.pescatarianGlutenBreakfastImage.image = UIImage(named: breakfastItem ["Image"]!)
            
            breakfastCell.layer.borderColor = UIColor.lightGray.cgColor
            breakfastCell.layer.borderWidth = 0.5
            
            return breakfastCell
        }
        if (collectionView == lunchCollectionView) {
            let lunchCell = lunchCollectionView.dequeueReusableCell(withReuseIdentifier: "LunchCell", for: indexPath) as! PescatarianImageCollectionView
            
            
            let lunchitem = self.lunchItems[indexPath.row]
            
            lunchCell.pescatarianGlutenLunchTextLabel.text = lunchLabels[indexPath.row]
            lunchCell.pescatarianGlutenLunchImage.image = UIImage(named: lunchitem ["Image"]!)
            
            lunchCell.layer.borderColor = UIColor.lightGray.cgColor
            lunchCell.layer.borderWidth = 0.5
            
            return lunchCell
        }
        let dinnerCell = dinnerCollectionView.dequeueReusableCell(withReuseIdentifier: "DinnerCell", for: indexPath) as! PescatarianImageCollectionView
        
        let dinnerItem = self.dinnerItems[indexPath.row]
        
        dinnerCell.pescatarianGlutenDinnerTextLabel.text = dinnerLabels[indexPath.row]
        dinnerCell.pescatarianGlutenDinnerImage.image = UIImage (named: dinnerItem ["Image"]!)
        
        dinnerCell.layer.borderColor = UIColor.lightGray.cgColor
        dinnerCell.layer.borderWidth = 0.5
        
        return dinnerCell
    
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if (collectionView == breakfastCollectionView) {
            
            let breakfastCell = breakfastCollectionView.cellForItem(at: indexPath)
            breakfastCell?.layer.borderColor = UIColor.lightGray.cgColor
            breakfastCell?.layer.borderWidth = 0.5
        }
        if (collectionView == lunchCollectionView) {
            
            let lunchCell = lunchCollectionView.cellForItem(at: indexPath)
            lunchCell?.layer.borderColor = UIColor.lightGray.cgColor
            lunchCell?.layer.borderWidth = 0.5
            
        }
        if (collectionView == dinnerCollectionView) {
            
            let dinnerCell = dinnerCollectionView.cellForItem(at: indexPath)
            dinnerCell?.layer.borderColor = UIColor.lightGray.cgColor
            dinnerCell?.layer.borderWidth = 0.5
            
        }
    }
    
    
}
