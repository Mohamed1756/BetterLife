import UIKit

class VeganBasicIntolerance: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var breakfastCollectionView: UICollectionView!
    @IBOutlet weak var lunchCollectionView: UICollectionView!
    @IBOutlet weak var dinnerCollectionView: UICollectionView!
    
    let mealLabels = [
        ["Chia pudding", "Protein pancakes", "Vegan fry-up", "Blackcurrant compote", "Tropical smoothie bowl"], // Breakfast
        ["Bean, tomato & watercress salad","Falafel burgers", "Indian chickpea & vegetable soup", "Minted green bean salad", "Curried Cauliflower Soup"], // Lunch
        ["Vegan chilli", "Chilli & avocado salsa sweet potatoes", "Spiced aubergine bake", "Chickpea curry", "Green masala butternut squash curry"] // Dinner
    ]
    
    var mealItems: [[[String: String]]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMealItems()
    }
    
    func loadMealItems() {
        mealItems.append(loadPlist(named: "VeganBreakfast"))
        mealItems.append(loadPlist(named: "VeganLunch"))
        mealItems.append(loadPlist(named: "VeganDinner"))
    }
    
    func loadPlist(named plistName: String) -> [[String: String]] {
        guard let path = Bundle.main.path(forResource: plistName, ofType: "plist"),
              let array = NSArray(contentsOfFile: path) as? [[String: String]] else {
            return []
        }
        return array
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
              let mealType = identifier.split(separator: "To").first,
              let mealIndex = ["Breakfast", "Lunch", "Dinner"].firstIndex(of: String(mealType)) else {
            return
        }
        
        if let indexPath = (sender as? UICollectionViewCell).flatMap({ collectionView.indexPath(for: $0) }) {
            let mealItem = mealItems[mealIndex][indexPath.row]
            let detail = segue.destination as! RecipeForNothing
            
            detail.sentData1 = mealItem["Title"]
            detail.sentData2 = mealItem["Recipe"]
            detail.sentData3 = mealItem["Image"]
            detail.sentData4 = mealItem["Description"]
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let mealIndex = [breakfastCollectionView, lunchCollectionView, dinnerCollectionView].firstIndex(of: collectionView) else {
            return 0
        }
        return mealItems[mealIndex].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let mealIndex = [breakfastCollectionView, lunchCollectionView, dinnerCollectionView].firstIndex(of: collectionView) else {
            return UICollectionViewCell()
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MealCell", for: indexPath) as! VeganImageCollectionView
        let mealItem = mealItems[mealIndex][indexPath.row]
        
        cell.configure(with: mealLabels[mealIndex][indexPath.row], imageName: mealItem["Image"])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        (collectionView.cellForItem(at: indexPath) as? VeganImageCollectionView)?.deselect()
    }
}

