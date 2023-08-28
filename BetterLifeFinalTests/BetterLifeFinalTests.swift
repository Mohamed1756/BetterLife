import XCTest
@testable import BetterLifeFinal

class LoginTest: XCTestCase {
    // test cases to check the login screen
    let storyboard = UIStoryboard(name: "Main", bundle: nil)

    func test_Login_Title(){
        
        let login = storyboard.instantiateViewController(withIdentifier: "loginScreen") as! LoginScreen
        let _ = login.view
        XCTAssertEqual("Great, let's get started.", login.loginTextLabel!.text!)
    }
    func test_Login_Placeholder(){
        let login = storyboard.instantiateViewController(withIdentifier: "loginScreen") as! LoginScreen
        let _ = login.view
        XCTAssertEqual("Email", login.emailTextField!.placeholder!)
        XCTAssertEqual("Password", login.passwordTextField!.placeholder!)
    }
    func test_Login_is_Password_Secure() throws{
        let login = storyboard.instantiateViewController(withIdentifier: "loginScreen") as! LoginScreen
        let _ = login.view
        
        let passwordTextfield = try XCTUnwrap(login.passwordTextField, "The password textfield is not connected")
        XCTAssertTrue(passwordTextfield.isSecureTextEntry,"The password textfield is not Secure Text Entry")
    }
    
    func test_Login_Email_KeyboardType() throws{
        let login = storyboard.instantiateViewController(withIdentifier: "loginScreen") as! LoginScreen
        let _ = login.view
        
        let emailTextfield = try XCTUnwrap(login.emailTextField, "Email TextField not connected to app ")
        XCTAssertEqual(emailTextfield.keyboardType, UIKeyboardType.emailAddress, "Email TextField does not have correct keyboard type")
    }
    func test_Login_Email_ContentType () throws{
        let login = storyboard.instantiateViewController(withIdentifier: "loginScreen") as! LoginScreen
        let _ = login.view
        
        let emailTextfield = try XCTUnwrap(login.emailTextField, "Email TextField not connected to app ")
        XCTAssertEqual(emailTextfield.textContentType,.emailAddress, "Email address TextField does not have correct content type set")
    }
}
