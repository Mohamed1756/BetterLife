import UIKit

class StayFitBeginner:UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var firstWeekCollectionView: UICollectionView!
    
    @IBOutlet weak var secondWeekCollectionView: UICollectionView!
    
    @IBOutlet weak var thirdWeekCollectionView: UICollectionView!
    
    
    
    let firstWeekLabels = ["Day 1", "Day 2", "Day 3", "Day 4"]
    let secondWeekLabels = ["Day 1", "Day 2", "Day 3", "Day 4"]
    let thirdWeekLabels = ["Day 1", "Day 2", "Day 3", "Day 4"]
    
    var firstWeekItems = [[String:String]]()
    var secondWeekItems = [[String:String]]()
    var thirdWeekItems = [[String:String]]()
    
    func StayFitBeginnerWeekOnePlist () -> [[String:String]] {
        
        let path = Bundle.main.path(forResource: "stayFitBeginnerWeekOne", ofType: "plist")
        
        return NSArray.init(contentsOf: URL.init (fileURLWithPath: path!)) as! [[String:String]]
        
    }
    func StayFitBeginnerWeekTwoPlist () -> [[String:String]] {
        
        let path1 = Bundle.main.path(forResource: "stayFitBeginnerWeekTwo", ofType: "plist")
        
        return NSArray.init(contentsOf: URL.init (fileURLWithPath: path1!)) as! [[String:String]]
        
    }
    func StayFitBeginnerWeekThreePlist () -> [[String:String]] {
        
        let path2 = Bundle.main.path(forResource: "stayFitBeginnerWeekThree", ofType: "plist")
        
        return NSArray.init(contentsOf: URL.init (fileURLWithPath: path2!)) as! [[String:String]]
        
    }
    
    override func viewDidLoad() {
        // load  images
        self.firstWeekItems = StayFitBeginnerWeekOnePlist()
        
        self.secondWeekItems = StayFitBeginnerWeekTwoPlist()
        
        self.thirdWeekItems = StayFitBeginnerWeekThreePlist()
     
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "stayFitBeginnerWeekOneToWorkout" {
           
            let detail = segue.destination as! WorkoutScreen
        
            if let indexPath = self.firstWeekCollectionView?.indexPath(for: sender as! UICollectionViewCell) {
                
                let firstWeekItem = self.firstWeekItems [indexPath.row]
           
                detail.sentData1 = firstWeekItem ["Title"]
                detail.sentData2 = firstWeekItem ["Day"]
                detail.sentData3 = firstWeekItem ["Image"]
                detail.sentData4 = firstWeekItem ["Description"]
            }
        }
        if segue.identifier == "stayFitBeginnerWeekTwoToWorkout" {
            
            let detail = segue.destination as! WorkoutScreen
        
            if let indexPath = self.secondWeekCollectionView?.indexPath(for: sender as! UICollectionViewCell) {
                
                let secondWeekItem = self.secondWeekItems [indexPath.row]
           
                detail.sentData1 = secondWeekItem ["Title"]
                detail.sentData2 = secondWeekItem ["Day"]
                detail.sentData3 = secondWeekItem ["Image"]
                detail.sentData4 = secondWeekItem ["Description"]
            }
        }
        if segue.identifier == "stayFitBeginnerWeekThreeToWorkout" {
           
            let detail = segue.destination as! WorkoutScreen
        
            if let indexPath = self.thirdWeekCollectionView?.indexPath(for: sender as! UICollectionViewCell) {
                
                let thirdWeekItem = self.thirdWeekItems [indexPath.row]
           
                detail.sentData1 = thirdWeekItem ["Title"]
                detail.sentData2 = thirdWeekItem ["Day"]
                detail.sentData3 = thirdWeekItem ["Image"]
                detail.sentData4 = thirdWeekItem ["Description"]
            }
        }
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if (collectionView == firstWeekCollectionView) {
            return 1
        }
        if (collectionView == secondWeekCollectionView) {
            return 1
        }
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == firstWeekCollectionView) {
            return self.firstWeekItems.count
        }
        if (collectionView == secondWeekCollectionView) {
            return self.secondWeekItems.count
        }
        return self.thirdWeekItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == firstWeekCollectionView) {
            
            let WeekOneCell = firstWeekCollectionView.dequeueReusableCell(withReuseIdentifier: "WeekOneCell", for: indexPath) as! StayFitImageCollectionView
            
            let firstWeekItem = self.firstWeekItems[indexPath.row]
            
            WeekOneCell.stayFitBeginnerWeekOneTextLabel.text = firstWeekLabels[indexPath.row]
            WeekOneCell.stayFitBeginnerWeekOneImage.image = UIImage(named:firstWeekItem ["Image"]!)
            
            WeekOneCell.layer.borderColor = UIColor.lightGray.cgColor
            WeekOneCell.layer.borderWidth = 0.5
            
            return WeekOneCell
        }
        if (collectionView == secondWeekCollectionView) {
            
            let WeekTwoCell = secondWeekCollectionView.dequeueReusableCell(withReuseIdentifier: "WeekTwoCell", for: indexPath) as! StayFitImageCollectionView
            
            let secondWeekItem = self.secondWeekItems[indexPath.row]
            
            WeekTwoCell.stayFitBeginnerWeekTwoTextLabel.text = secondWeekLabels[indexPath.row]
            WeekTwoCell.stayFitBeginnerWeekTwoImage.image = UIImage(named: secondWeekItem ["Image"]!)
            
            WeekTwoCell.layer.borderColor = UIColor.lightGray.cgColor
            WeekTwoCell.layer.borderWidth = 0.5
            
            return WeekTwoCell
        }
        let WeekThreeCell = thirdWeekCollectionView.dequeueReusableCell(withReuseIdentifier: "WeekThreeCell", for: indexPath) as! StayFitImageCollectionView
        
        let thirdWeekItem = self.thirdWeekItems[indexPath.row]
        
        WeekThreeCell.stayFitBeginnerWeekThreeTextLabel.text = thirdWeekLabels[indexPath.row]
        WeekThreeCell.stayFitBeginnerWeekThreeImage.image = UIImage(named: thirdWeekItem ["Image"]!)
        
        WeekThreeCell.layer.borderColor = UIColor.lightGray.cgColor
        WeekThreeCell.layer.borderWidth = 0.5
        
        return WeekThreeCell
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if (collectionView == firstWeekCollectionView) {
            
            let WeekOneCell = firstWeekCollectionView.cellForItem(at: indexPath)
            WeekOneCell?.layer.borderColor = UIColor.lightGray.cgColor
            WeekOneCell?.layer.borderWidth = 0.5
        }
        if (collectionView == secondWeekCollectionView) {
            
            let WeekTwoCell = secondWeekCollectionView.cellForItem(at: indexPath)
            WeekTwoCell?.layer.borderColor = UIColor.lightGray.cgColor
            WeekTwoCell?.layer.borderWidth = 0.5
            
        }
        if (collectionView == thirdWeekCollectionView) {
            
            let WeekThreeCell = thirdWeekCollectionView.cellForItem(at: indexPath)
            WeekThreeCell?.layer.borderColor = UIColor.lightGray.cgColor
            WeekThreeCell?.layer.borderWidth = 0.5
            
        }
    }

    
}
