//
//  RegistrationPageUITests.swift
//  BetterLifeFinalTests
//
//  Created by Mohamed on 24/02/2021.
//

import XCTest
@testable import BetterLifeFinal

class RegistrationScreenTests:XCTestCase {
    // test cases for the registration screen
   
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    func test_Registration_Name_TextField () throws {
        let register = storyboard.instantiateViewController(withIdentifier: "registrationScreen") as! SignUpScreen
       let _ = register.view
        
        let nameTextField = try XCTUnwrap(register.firstNameTextField, "Name TextField is not connected to app")
        XCTAssertTrue(nameTextField.allowsEditingTextAttributes, "User can input text")
    }
    func test_Registration_Placeholders () {
        let register = storyboard.instantiateViewController(withIdentifier: "registrationScreen") as! SignUpScreen
       let _ = register.view
        
        XCTAssertEqual("Enter Email", register.emailTextField!.placeholder)
        XCTAssertEqual("Password", register.passwordTextField!.placeholder)
        XCTAssertEqual("Name", register.firstNameTextField!.placeholder)
    }
    
    func test_Registration_Buttons() throws {
        let register = storyboard.instantiateViewController(withIdentifier: "registrationScreen") as! SignUpScreen
       let _ = register.view
       
        
        //Check if Controller has UIButton property
        let profileButton:UIButton = register.changeProfilePictureButton
        XCTAssertNotNil(profileButton, "The Screen does not have a change profile pic button ")
        
        let signUpButton:UIButton = register.signUpTapped
        XCTAssertNotNil(signUpButton, "The Screen does not have a signup button ")
        
        // Attempt Access UIButton Actions
        
 //       guard let signUpButtonAction = signUpButton.actions(forTarget: register, forControlEvent: .touchUpInside) else {
//  XCTFail("UIButton does not have actions assigned for Control Event .touchUpInside")
   //         return
 //       }
  //      XCTAssertTrue(signUpButtonAction.contains("SignUp button pressed:"))
        
    }
    
}
    
    
    

