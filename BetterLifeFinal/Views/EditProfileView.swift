//
//  EditProfileView.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 06/02/2021.
//

import UIKit

class EditProfileView:UIViewController,UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var flag = 0
    let image = UIImagePickerController()
    
    @IBOutlet weak var firstPhotoButton: UIButton!
    
    @IBOutlet weak var firstPhotoChoice: UIImageView!
    
    @IBOutlet weak var secondPhotoChoice: UIImageView!
    
    @IBOutlet weak var thirdPhotoChoice: UIImageView!
    
    @IBOutlet weak var weightGoalTextField: UITextField!
    
    @IBOutlet weak var currentWeightTextField: UITextField!
    
    @IBOutlet weak var targetWeightTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
           if let name = defaults.string(forKey: "weightGoalValue"){
            weightGoalTextField.text = name
        }
        if let currentWeight = defaults.string(forKey: "currentWeightValue"){
            currentWeightTextField.text = currentWeight
     }
        if let targetWeight = defaults.string(forKey: "targetWeightValue"){
            targetWeightTextField.text = targetWeight
     }
        if UserDefaults.standard.object(forKey: "keyPhotoImage1") != nil
     {
     let data = UserDefaults.standard.object(forKey: "keyPhotoImage1") as! NSData
            firstPhotoChoice.image = UIImage(data: data as Data)
     }
        if UserDefaults.standard.object(forKey: "keyPhotoImage2") != nil
     {
     let data = UserDefaults.standard.object(forKey: "keyPhotoImage2") as! NSData
     secondPhotoChoice.image = UIImage(data: data as Data)
     }
        if UserDefaults.standard.object(forKey: "keyPhotoImage3") != nil
     {
     let data = UserDefaults.standard.object(forKey: "keyPhotoImage3") as! NSData
     thirdPhotoChoice.image = UIImage(data: data as Data)
     }
        
    }

    @IBAction func firstPhotoButtonClick(_ sender: UIButton) {
      
        flag = 1
        image.delegate = self
        image.sourceType = .photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true) {
            
        }
        
    }
    @IBAction func secondPhotoButtonClicked(_ sender: Any) {
        flag = 2
        image.delegate = self
        image.sourceType = .photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true) {
            
        }
    }
    
    @IBAction func thirdPhotoButtonClicked(_ sender: Any) {
        
        flag = 3
        image.delegate = self
        image.sourceType = .photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true) {
            
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info [UIImagePickerController.InfoKey.originalImage] as? UIImage {
            if flag == 1 {
                firstPhotoChoice.image = image
                let saveImage = firstPhotoChoice.image
                let imageData:NSData = saveImage!.pngData()! as NSData
                
                UserDefaults.standard.set(imageData, forKey: "keyPhotoImage1")
            }
            if flag == 2 {
                secondPhotoChoice.image = image
                let saveImage = secondPhotoChoice.image
                let imageData2:NSData = saveImage!.pngData()! as NSData
                UserDefaults.standard.set(imageData2, forKey: "keyPhotoImage2")

            }
            if flag == 3 {
                thirdPhotoChoice.image = image
                let saveImage = thirdPhotoChoice.image
                let imageData3:NSData = saveImage!.pngData()! as NSData
                UserDefaults.standard.set(imageData3, forKey: "keyPhotoImage3")

            }
            
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if (weightGoalTextField.text?.count)! > 0 {
            let defaults = UserDefaults.standard
            defaults.set(weightGoalTextField.text!, forKey: "weightGoalValue")
        }
        if (currentWeightTextField.text?.count)! > 0 {
            let defaults = UserDefaults.standard
            defaults.set(currentWeightTextField.text!, forKey: "currentWeightValue")
        }
        if (targetWeightTextField.text?.count)! > 0 {
            let defaults = UserDefaults.standard
            defaults.set(targetWeightTextField.text!, forKey: "targetWeightValue")
        }
    }
    
 
    @IBAction func resetButton(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "currentWeightValue")
        defaults.removeObject(forKey: "targetWeightValue")
        defaults.removeObject(forKey: "weightGoalValue")
        
        
        defaults.synchronize()
        
        
    }
    
    @IBAction func resetImagesButton(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "keyPhotoImage1")
        defaults.removeObject(forKey: "keyPhotoImage2")
        defaults.removeObject(forKey: "keyPhotoImage3")
        
        defaults.synchronize()
        
        
    }
    
}
