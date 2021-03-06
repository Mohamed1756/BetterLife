//
//  GlutenFreeBasic.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 20/01/2021.
//

import UIKit

class GlutenFreeBasic:UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet weak var breakfastCollectionView: UICollectionView!
    
    @IBOutlet weak var lunchCollectionView: UICollectionView!
    
    @IBOutlet weak var dinnerCollectionView: UICollectionView!
    
    let breakfastLabels = ["Poached eggs with smoked salmon", "Homemade Muesli ", "Indian scrambled eggs", "Eggs & potatoes", "Kiwi fruit smoothie"]
    let lunchLabels = ["Salmon & leek parcel","Thai green curry", "Healthy tuna lettuce wraps", "Mushroom buckwheat risotto", "Black bean, tofu & avocado rice bowl"]
    let dinnerLabels = ["Salmon & leek parcel", "Honey & orange roast sea bass with lentils", "Caponata pasta", "Green masala butternut squash curry", "Vegetarian Stuffed Peppers"]
    
    var breakfastItems = [[String:String]]()
    var lunchItems = [[String:String]]()
    var dinnerItems = [[String:String]]()
    
    func GlutenBreakfastPlist () -> [[String:String]] {
        
        let path = Bundle.main.path(forResource: "GlutenBreakfast", ofType: "plist")
        
        return NSArray.init(contentsOf: URL.init (fileURLWithPath: path!)) as! [[String:String]]
        
        
    }
    func GlutenLunchPlist() -> [[String:String]] {
        
        let path1 = Bundle.main.path (forResource: "GlutenLunch", ofType: "plist")
        
        return NSArray.init(contentsOf: URL.init (fileURLWithPath: path1!)) as! [[String:String]]
        
    }
    func GlutenDinnerPlist() -> [[String:String]] {
        
        let path2 = Bundle.main.path (forResource: "GlutenDinner", ofType: "plist")
        
        
        return NSArray.init(contentsOf: URL.init (fileURLWithPath: path2!)) as! [[String:String]]
    }
   
    override func viewDidLoad() {
        // load Breakfast images
        self.breakfastItems = GlutenBreakfastPlist()
        // load Lunch Images
        self.lunchItems = GlutenLunchPlist()
        // load dinner images
        self.dinnerItems = GlutenDinnerPlist()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "glutenBasicBreakfastToRecipe" {
           
            let detail = segue.destination as! RecipeForNothing
        
            if let indexPath = self.breakfastCollectionView?.indexPath(for: sender as! UICollectionViewCell) {
                
                let breakfastItem = self.breakfastItems [indexPath.row]
           
                detail.sentData1 = breakfastItem ["Title"]
                detail.sentData2 = breakfastItem ["Recipe"]
                detail.sentData3 = breakfastItem ["Image"]
                detail.sentData4 = breakfastItem ["Description"]
            }
        }
        if segue.identifier == "glutenBasicLunchToRecipe" {
               
                let detail = segue.destination as! RecipeForNothing
            
                if let indexPath = self.lunchCollectionView?.indexPath(for: sender as! UICollectionViewCell) {
                    
                    let lunchItem = self.lunchItems[indexPath.row]
               
                    detail.sentData1 = lunchItem ["Title"]
                    detail.sentData2 = lunchItem ["Recipe"]
                    detail.sentData3 = lunchItem ["Image"]
                    detail.sentData4 = lunchItem ["Description"]
                }
        }
        if segue.identifier == "glutenBasicDinnerToRecipe" {
           
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
            
            let breakfastCell = breakfastCollectionView.dequeueReusableCell(withReuseIdentifier: "BreakfastCell", for: indexPath) as!   GlutenFreeImageCollectionView
            
            let breakfastItem = self.breakfastItems[indexPath.row]
            
            breakfastCell.GlutenBasicBreakfastTextLabel.text = breakfastLabels[indexPath.row]
            breakfastCell.GlutenBasicBreakfastImage.image = UIImage(named: breakfastItem ["Image"]!)
            
            breakfastCell.layer.borderColor = UIColor.lightGray.cgColor
            breakfastCell.layer.borderWidth = 0.5
            
            return breakfastCell
        }
        if (collectionView == lunchCollectionView) {
            let lunchCell = lunchCollectionView.dequeueReusableCell(withReuseIdentifier: "LunchCell", for: indexPath) as! GlutenFreeImageCollectionView
            
            
            let lunchitem = self.lunchItems[indexPath.row]
            
            lunchCell.GlutenBasicLunchTextLabel.text = lunchLabels[indexPath.row]
            lunchCell.GlutenBasicLunchImage.image = UIImage(named: lunchitem ["Image"]!)
            
            lunchCell.layer.borderColor = UIColor.lightGray.cgColor
            lunchCell.layer.borderWidth = 0.5
            
            return lunchCell
        }
        let dinnerCell = dinnerCollectionView.dequeueReusableCell(withReuseIdentifier: "DinnerCell", for: indexPath) as! GlutenFreeImageCollectionView
        
        let dinnerItem = self.dinnerItems[indexPath.row]
        
        dinnerCell.GlutenBasicDinnerTextLabel.text = dinnerLabels[indexPath.row]
        dinnerCell.GlutenBasicDinnerImage.image = UIImage (named: dinnerItem ["Image"]!)
        
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
