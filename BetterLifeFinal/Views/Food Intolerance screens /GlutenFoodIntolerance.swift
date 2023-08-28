import UIKit

class GlutenFoodIntolerance: UIViewController {
    
    @IBOutlet weak var noneGlutenButton: UIButton!
    
    @IBOutlet weak var fishAndMeatButton: UIButton!
    
    @IBOutlet weak var dairyButton: UIButton!
    
    
    @IBOutlet weak var titleOneTextLabel: UILabel!
    
    
    @IBOutlet weak var titleTwoTextLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Display Button & Text Titles
        TitleText()
        
        ButtonTitles()

    }

    // Button Titles
    
    func ButtonTitles() {
        
        noneGlutenButton.setTitle("None", for: .normal)
        
        fishAndMeatButton.setTitle("Fish & Meat", for: .normal)
        
        dairyButton.setTitle("Dairy", for: .normal)
    }
    
    // Title Text
    
    func TitleText() {
        
        titleOneTextLabel.text = "Any Food"
        titleTwoTextLabel.text = "Intolerance"
        
    }
    
    
    @IBAction func noneGlutenButtonTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "ToGlutenFreeBasic", sender: self)
        
    
    }
    
    
    
    
    
    
    
    
}
