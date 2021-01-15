//
//  FirebaseAuthManager.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 31/12/2020.
//

import UIKit
import FirebaseAuth

class FirebaseAuthManager {
    func createUser(email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error ) in
            
            if let user = authResult?.user {
                
                print(user)
                completionBlock(true)
               
        } else {
                completionBlock(false)
        }
    }
}
}

