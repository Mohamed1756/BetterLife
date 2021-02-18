//
//  VeganGlutenIntolerance.swift
//  BetterLifeFinal
//  Gluten Free Meal plans
//  Created by Mohamed on 15/01/2021.
//

import UIKit

class VeganGlutenIntolerance:UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var breakfastCollectionView: UICollectionView!
    
  
    @IBOutlet weak var lunchCollectionView: UICollectionView!
    
    
    @IBOutlet weak var dinnerCollectionView: UICollectionView!
    
    let breakfastLabels = ["Protein pancakes", "Vegan fry-up", "Blackcurrant compote", "Tropical smoothie bowl", "Kiwi fruit smoothie"]
    let lunchLabels = ["Bean, tomato & watercress salad","Quick hummus", "Black bean, tofu & avocado rice bowl", "Minted green bean salad", "Curried Cauliflower Soup"]
    let dinnerLabels = ["Vegan chilli", "apple", "shake", "avacado", "rice", "last food"]
    
    var breakfastItems = [[String:String]]()
    var lunchItems = [[String:String]]()
    var dinnerItems = [[String:String]]()
    
    func veganGlutenBreakfastPlist () -> [[String:String]] {
        
        let path = Bundle.main.path(forResource: "VeganGlutenBreakfast", ofType: "plist")
        
        return NSArray.init(contentsOf: URL.init (fileURLWithPath: path!)) as! [[String:String]]
        
        
    }
    func veganGlutenLunchPlist() -> [[String:String]] {
        
        let path1 = Bundle.main.path (forResource: "VeganGlutenLunch", ofType: "plist")
        
        return NSArray.init(contentsOf: URL.init (fileURLWithPath: path1!)) as! [[String:String]]
        
    }
    func veganGlutenDinnerPlist() -> [[String:String]] {
        
        let path2 = Bundle.main.path (forResource: "VeganGlutenDinner", ofType: "plist")
        
        
        return NSArray.init(contentsOf: URL.init (fileURLWithPath: path2!)) as! [[String:String]]
    }
    
    
    override func viewDidLoad() {
        
        // load Breakfast images
        self.breakfastItems = veganGlutenBreakfastPlist()
        // load Lunch Images
        self.lunchItems = veganGlutenLunchPlist()
        // load dinner images
        self.dinnerItems = veganGlutenDinnerPlist()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "veganGlutenBreakfastToRecipe" {
           
            let detail = segue.destination as! RecipeForNothing
        
            if let indexPath = self.breakfastCollectionView?.indexPath(for: sender as! UICollectionViewCell) {
                
                let breakfastItem = self.breakfastItems [indexPath.row]
           
                detail.sentData1 = breakfastItem ["Title"]
                detail.sentData2 = breakfastItem ["Recipe"]
                detail.sentData3 = breakfastItem ["Image"]
                detail.sentData4 = breakfastItem ["Description"]
            }
        }
        if segue.identifier == "veganGlutenLunchToRecipe" {
               
                let detail = segue.destination as! RecipeForNothing
            
                if let indexPath = self.lunchCollectionView?.indexPath(for: sender as! UICollectionViewCell) {
                    
                    let lunchItem = self.lunchItems[indexPath.row]
               
                    detail.sentData1 = lunchItem ["Title"]
                    detail.sentData2 = lunchItem ["Recipe"]
                    detail.sentData3 = lunchItem ["Image"]
                    detail.sentData4 = lunchItem ["Description"]
                }
        }
        if segue.identifier == "veganGlutenDinnerToRecipe" {
           
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
            
            let breakfastCell = breakfastCollectionView.dequeueReusableCell(withReuseIdentifier: "BreakfastCell", for: indexPath) as! VeganImageCollectionView
            
            let breakfastItem = self.breakfastItems[indexPath.row]
            
            breakfastCell.veganGlutenBreakfastTextLabel.text = breakfastLabels[indexPath.row]
            breakfastCell.veganGlutenBreakfastImage.image = UIImage(named: breakfastItem ["Image"]!)
            
            breakfastCell.layer.borderColor = UIColor.lightGray.cgColor
            breakfastCell.layer.borderWidth = 0.5
            
            return breakfastCell
        }
        if (collectionView == lunchCollectionView) {
            let lunchCell = lunchCollectionView.dequeueReusableCell(withReuseIdentifier: "LunchCell", for: indexPath) as! VeganImageCollectionView
            
            let lunchitem = self.lunchItems[indexPath.row]
            
            lunchCell.veganGlutenLunchTextLabel.text = lunchLabels[indexPath.row]
            lunchCell.veganGlutenLunchImage.image = UIImage(named: lunchitem ["Image"]!)
            
            lunchCell.layer.borderColor = UIColor.lightGray.cgColor
            lunchCell.layer.borderWidth = 0.5
            
            return lunchCell
        }
        let dinnerCell = dinnerCollectionView.dequeueReusableCell(withReuseIdentifier: "DinnerCell", for: indexPath) as! VeganImageCollectionView
        
        let dinnerItem = self.dinnerItems[indexPath.row]
        
        dinnerCell.veganGlutenDinnerTextLabel.text = dinnerLabels[indexPath.row]
        dinnerCell.veganGlutenDinnerImage.image = UIImage (named: dinnerItem ["Image"]!)
        
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
