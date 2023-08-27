import UIKit

class RecipeForNothing: UIViewController {
    
   
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var mealImage: UIImageView!
    
    @IBOutlet weak var recipeLabel: UILabel!

    @IBOutlet weak var mealTextView: UITextView!
    
    
    
    
    
    var sentData1:String!
    var sentData2:String!
    var sentData3:String!
    var sentData4:String!
        
    override func viewDidLoad() {
        
        mealImage.image = UIImage(named: sentData3)
        titleLabel.text = sentData1
        recipeLabel.text = sentData2
        mealTextView.text = sentData4
        
    }
}
