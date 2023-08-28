import UIKit

class NoneSelectedFood: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var lunchCollectionView: UICollectionView!
    
    @IBOutlet weak var dinnerCollectionView: UICollectionView!
    
    
     //let imageArray = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5"),]

    let itemLabels = ["Homemade Muesli", "Protein pancakes", "Poached eggs with smoked salmon", "Vegan fry-up", "Veggie Sandwich"]
    
    let lunchLabels = ["Lentil Soup","Lime prawn cocktail pitta salad", "Melon & crunchy bran pots", "Salmon & leek parcel", "Vegetable Paella"]
    
    let dinnerLabels = ["Vegetable Fried Rice", "Sweet potato curry", "Honey & orange roast sea bass with lentils", "Spiced aubergine bake", "Salmon & leek parcel"]
    
    var items = [[String:String]]()
    var lunchItems = [[String:String]]()
    var dinnerItems = [[String:String]]()
    
    func loadPlist() -> [[String:String]] {
        
        let path = Bundle.main.path(forResource: "Food", ofType: "plist")
        
        return NSArray.init(contentsOf: URL.init (fileURLWithPath: path!)) as! [[String:String]]
        
    }
    
    func LunchPlist() -> [[String:String]] {
        
        let path1 = Bundle.main.path (forResource: "LunchSelection", ofType: "plist")
        
        return NSArray.init(contentsOf: URL.init (fileURLWithPath: path1!)) as! [[String:String]]
        
    }
    
    func dinnerPlist() -> [[String:String]] {
        
        let path2 = Bundle.main.path (forResource: "DinnerSelection", ofType: "plist")
        
        return NSArray.init(contentsOf: URL.init (fileURLWithPath: path2!)) as! [[String:String]]
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // load Breakfast images
        self.items = loadPlist()
        // load Lunch Images
        self.lunchItems = LunchPlist()
        // load dinner images
        self.dinnerItems = dinnerPlist()
        
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
        
        if segue.identifier == "showDetail" {
           
            let detail = segue.destination as! RecipeForNothing
        
            if let indexPath = self.collectionView?.indexPath(for: sender as! UICollectionViewCell) {
                
                let item = self.items[indexPath.row]
           
                detail.sentData1 = item ["Title"]
                detail.sentData2 = item ["Recipe Title"]
                detail.sentData3 = item ["Image"]
                detail.sentData4 = item ["Description"]
            }
        }
        if segue.identifier == "showLunchView" {
          
                let detail = segue.destination as! RecipeForNothing
                
                    if let indexPath = self.lunchCollectionView?.indexPath(for: sender as! UICollectionViewCell) {
                        let lunchItem = self.lunchItems[indexPath.row]
                        
                        detail.sentData1 = lunchItem ["Title"]
                        detail.sentData2 = lunchItem ["Recipe Title"]
                        detail.sentData3 = lunchItem ["Image"]
                        detail.sentData4 = lunchItem ["Description"]
                    }
        }
        
        if segue.identifier == "showDinnerView" {
            let detail = segue.destination as! RecipeForNothing
            
            if let indexPath = self.dinnerCollectionView?.indexPath(for: sender as! UICollectionViewCell) {
                
                let dinnerItem = dinnerItems[indexPath.row]
                
                detail.sentData1 = dinnerItem ["Title"]
                detail.sentData2 = dinnerItem ["Recipe"]
                detail.sentData3 = dinnerItem ["Image"]
                detail.sentData4 = dinnerItem ["Description"]
                
        }
       }
        
    }
    

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if (collectionView == lunchCollectionView) {
            return 1
        }
        if (collectionView == dinnerCollectionView){
           
            return 1
        }
            
        
            return 1
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == lunchCollectionView) {
            
            return self.lunchItems.count
        }
       if (collectionView == dinnerCollectionView) {
            
            return self.dinnerItems.count
        }
        
        return self.items.count
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == lunchCollectionView) {
            
            let lunchCell = lunchCollectionView.dequeueReusableCell(withReuseIdentifier: "lunchCell", for: indexPath) as! imageCollectionView
            
            let lunchitem = self.lunchItems[indexPath.row]
            
            lunchCell.lunchTextLabel.text = lunchLabels[indexPath.row]
            lunchCell.lunchImage.image = UIImage(named: lunchitem ["Image"]!)
            
            lunchCell.layer.borderColor = UIColor.lightGray.cgColor
            lunchCell.layer.borderWidth = 0.5
            
            return lunchCell
        }
        if (collectionView == dinnerCollectionView) {
            
            let dinnerCell = dinnerCollectionView.dequeueReusableCell(withReuseIdentifier: "DinnerCell", for: indexPath) as! imageCollectionView
            
            let dinnerItem = self.dinnerItems[indexPath.row]
            
            dinnerCell.dinnerTextLabel.text = dinnerLabels[indexPath.row]
            dinnerCell.dinnerImage.image = UIImage(named: dinnerItem ["Image"]!)
            
            dinnerCell.layer.borderColor = UIColor.lightGray.cgColor
            dinnerCell.layer.borderWidth = 0.5
            
            return dinnerCell
            
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! imageCollectionView
        
       
       
        let item = self.items[indexPath.row]
       
        
        
        cell.breakfastTextLabel.text = itemLabels[indexPath.row]
        cell.imgImage.image = UIImage(named: item ["Image"]!)
        
       
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView == lunchCollectionView) {
            
            let lunchCell = lunchCollectionView.cellForItem(at: indexPath)
            lunchCell?.layer.borderColor = UIColor.gray.cgColor
            lunchCell?.layer.borderWidth = 1
        }
       else if (collectionView == dinnerCollectionView) {
            
            let dinnerCell = dinnerCollectionView.cellForItem(at: indexPath)
            dinnerCell?.layer.borderColor = UIColor.gray.cgColor
            dinnerCell?.layer.borderWidth = 1
            
            
        }

        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.borderWidth = 1
        
        
    }
   
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if (collectionView == lunchCollectionView) {
            
            let lunchCell = lunchCollectionView.cellForItem(at: indexPath)
            lunchCell?.layer.borderColor = UIColor.lightGray.cgColor
            lunchCell?.layer.borderWidth = 0.5
        }
       else  if (collectionView == dinnerCollectionView) {
            
            let dinnerCell = dinnerCollectionView.cellForItem(at: indexPath)
            dinnerCell?.layer.borderColor = UIColor.lightGray.cgColor
            dinnerCell?.layer.borderWidth = 0.5
            
            
        }
        
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 0.5
    }
    
    
    @IBAction func doneButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "backToFoodIntolerance", sender: self)
    }
    
}
