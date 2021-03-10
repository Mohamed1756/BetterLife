//
//  EggsIntolerance.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 12/01/2021.
//

import UIKit

class EggsIntolerance: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var breakfastCollectionView: UICollectionView!
    
    @IBOutlet weak var lunchCollectionView: UICollectionView!
    
    @IBOutlet weak var dinnerCollectionView: UICollectionView!
    
 
    
    let breakfastLabels = ["Homemade Muesli", "Blueberry & banana power smoothie", "Protein pancakes", "Avocado toast", "Carrot cake porridge"]
    
    let lunchLabels = ["Salmon & leek parcel","Thai green curry", "Vegetable Paella", "Sesame salmon & sweet potato mash", "Lime prawn cocktail pitta salad"]
    
    let dinnerLabels = ["Vegetable Fried Rice", "Japanese noodles with sesame dressing", "Vegetarian Stuffed Peppers", "Sesame salmon & sweet potato mash", "Falafel burgers"]
    
    var breakfastItems = [[String:String]]()
    var lunchItems = [[String:String]]()
    var dinnerItems = [[String:String]]()
    
    
    func breakfastPlist () -> [[String:String]] {
        
        let path = Bundle.main.path(forResource: "EggsBreakfast", ofType: "plist")
        
        return NSArray.init(contentsOf: URL.init (fileURLWithPath: path!)) as! [[String:String]]
        
        
    }
    func LunchPlist() -> [[String:String]] {
        
        let path1 = Bundle.main.path (forResource: "EggsLunch", ofType: "plist")
        
        return NSArray.init(contentsOf: URL.init (fileURLWithPath: path1!)) as! [[String:String]]
        
    }
    
    func dinnerPlist() -> [[String:String]] {
        
        let path2 = Bundle.main.path (forResource: "EggsDinner", ofType: "plist")
        
        return NSArray.init(contentsOf: URL.init (fileURLWithPath: path2!)) as! [[String:String]]
        
    }
    override func viewDidLoad() {
        
        // load Breakfast images
        self.breakfastItems = breakfastPlist()
        // load Lunch Images
        self.lunchItems = LunchPlist()
        // load dinner images
        self.dinnerItems = dinnerPlist()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
        if segue.identifier == "eggsBreakfastToRecipe" {
           
            let detail = segue.destination as! RecipeForNothing
        
            if let indexPath = self.breakfastCollectionView?.indexPath(for: sender as! UICollectionViewCell) {
                
                let breakfastItem = self.breakfastItems[indexPath.row]
           
                detail.sentData1 = breakfastItem ["Title"]
                detail.sentData2 = breakfastItem ["Recipe"]
                detail.sentData3 = breakfastItem ["Image"]
                detail.sentData4 = breakfastItem ["Description"]
            }
            
        }
        if segue.identifier == "eggsLunchToRecipe" {
           
            let detail = segue.destination as! RecipeForNothing
        
            if let indexPath = self.lunchCollectionView?.indexPath(for: sender as! UICollectionViewCell) {
                
                let lunchItem = self.lunchItems[indexPath.row]
           
                detail.sentData1 = lunchItem ["Title"]
                detail.sentData2 = lunchItem ["Recipe"]
                detail.sentData3 = lunchItem ["Image"]
                detail.sentData4 = lunchItem ["Descriptions"]
            }
            
        }
        if segue.identifier == "eggsDinnerToRecipe" {
           
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
            
            let breakfastCell = breakfastCollectionView.dequeueReusableCell(withReuseIdentifier: "BreakfastCell", for: indexPath) as! imageCollectionView
            let breakfastItem = self.breakfastItems[indexPath.row]
            
            breakfastCell.eggsBreakfastTextLabel.text = breakfastLabels[indexPath.row]
            breakfastCell.eggsBreakfastImage.image = UIImage(named: breakfastItem ["Image"]!)
            
            breakfastCell.layer.borderColor = UIColor.lightGray.cgColor
            breakfastCell.layer.borderWidth = 0.5
            
            return breakfastCell
        }
        if (collectionView == lunchCollectionView) {
            let lunchCell = lunchCollectionView.dequeueReusableCell(withReuseIdentifier: "LunchCell", for: indexPath) as! imageCollectionView
            
            let lunchitem = self.lunchItems[indexPath.row]
            
            lunchCell.eggsLunchTextLabel.text = lunchLabels[indexPath.row]
            lunchCell.eggsLunchImage.image = UIImage(named: lunchitem ["Image"]!)
            
            lunchCell.layer.borderColor = UIColor.lightGray.cgColor
            lunchCell.layer.borderWidth = 0.5
            
            return lunchCell
        }
        let dinnerCell = dinnerCollectionView.dequeueReusableCell(withReuseIdentifier: "DinnerCell", for: indexPath) as! imageCollectionView
        
        let dinnerItem = self.dinnerItems[indexPath.row]
        
        dinnerCell.eggsDinnerTextLabel.text = dinnerLabels[indexPath.row]
    
        
        dinnerCell.eggsDinnerImage.image = UIImage (named: dinnerItem ["Image"]!)
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

