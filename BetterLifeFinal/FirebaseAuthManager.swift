import UIKit
import FirebaseAuth

class FirebaseAuthManager {
    typealias CompletionHandler = (Bool) -> Void
    
    func createUser(email: String, password: String, completion: @escaping CompletionHandler) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error creating user:", error.localizedDescription)
                completion(false)
                return
            }
            
            if let user = authResult?.user {
                print("User created:", user)
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
