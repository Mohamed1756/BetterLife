//
//  SignUpScreen.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 31/12/2020.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class SignUpScreen:UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var changeProfilePictureButton: UIButton!
    
    var imagePicker:UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageTap = UITapGestureRecognizer (target: self, action: #selector (openImagePicker))
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(imageTap)
        profileImageView.layer.cornerRadius = profileImageView.bounds.height / 2
        profileImageView.clipsToBounds = true
        changeProfilePictureButton.addTarget(self, action: #selector (openImagePicker), for: .touchUpInside)
        
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
    }
    // validate user registration
    @objc func openImagePicker(_ sender: Any){
        self.present(imagePicker, animated: true, completion: nil)
    }
    // registers user on firebase
    @IBAction func signUpTapped(_ sender: Any) {
        
        guard let Name = firstNameTextField.text else {return}
        guard let image = profileImageView.image else {return}
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!){ (user, error) in
         if error == nil && user != nil {
        // upload Picture on Firebase
            self.uploadProfileImage(image){url in
                if url != nil {
                    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                    changeRequest?.displayName = Name
                    changeRequest?.photoURL = url
                    
                    changeRequest?.commitChanges { error in
                        
                        if error == nil {
                            print ("User display name changed")
                            
                            self.saveProfileData(name: Name, profileImageURL: url!) { success in
                                if success {
                                    self.dismiss(animated: false, completion: nil)

                                }
                                
                            }
                        }else {
                            // fail - unable to upload pic
                        }
                    }
                    
                }
                
            }
         
         }
         else{
           let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
           let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
               }
                    }
              }
    func uploadProfileImage (_ image:UIImage, completion: @escaping((_ url: URL?) ->())) {
        
        // reference Firebase storage
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let storageRef = Storage.storage().reference().child("user/\(uid)")
        
        guard let imageData = image.jpegData(compressionQuality: 0.75) else {
            return
        }
        let metaData = StorageMetadata()
        metaData.contentType = "Image/Jpeg"
        
        storageRef.putData(imageData,metadata: metaData){ metaData,error in
            if error == nil && metaData != nil {
                storageRef.downloadURL { (url, error) in
                    if error != nil {
                       completion(nil)
                    }else {
                        completion(url)
                    }
                }
            } else {
                // failed
                completion (nil)
            }
        }
        
                
}
        
    func saveProfileData (name:String, profileImageURL:URL,completion: @escaping((_ success:Bool) ->())) {
        guard let uid = Auth.auth().currentUser?.uid else {return }
        let databaseRef = Database.database().reference().child("users/profile/\(uid)")
        
        let userObject = [
            "Name": name,
            "photoURL":profileImageURL.absoluteString
        ] as [String:Any]
        databaseRef.setValue(userObject) { error, ref in
            completion(error == nil)
        }
    }
      
    
}
// choose profile picture
extension SignUpScreen: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let chosenImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.profileImageView.image = chosenImage
        }
        picker.dismiss(animated: true, completion: nil)

    }
    
}
