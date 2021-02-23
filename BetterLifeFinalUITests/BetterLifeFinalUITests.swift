//
//  BetterLifeFinalUITests.swift
//  BetterLifeFinalUITests
//
//  Created by Mohamed on 23/02/2021.
//

import XCTest

class BetterLifeFinalUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.staticTexts["Get Started "]/*[[".buttons[\"Get Started \"].staticTexts[\"Get Started \"]",".staticTexts[\"Get Started \"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.textFields["Name"].tap()
        
        let element2 = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element
        let element = element2.children(matching: .other).element
        element.tap()
        
        let emailTextField = app.textFields["Email "]
        emailTextField.tap()
        emailTextField.tap()
        
        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.tap()
        
        let signUpButton = app.buttons["Sign Up"]
        signUpButton.tap()
        
        let okButton = app.alerts["Error"].scrollViews.otherElements.buttons["OK"]
        okButton.tap()
        passwordTextField.tap()
        signUpButton.tap()
        okButton.tap()
        emailTextField.tap()
        emailTextField.tap()
        signUpButton.tap()
        app.buttons["Progress"].tap()
        
        let weightGoalTextField = app.scrollViews.otherElements.containing(.staticText, identifier:"PHOTOS").children(matching: .textField).matching(identifier: "Weight Goal").element(boundBy: 0)
        weightGoalTextField.tap()
        weightGoalTextField.tap()
        app/*@START_MENU_TOKEN@*/.pickerWheels["Lose Weight"]/*[[".pickers.pickerWheels[\"Lose Weight\"]",".pickerWheels[\"Lose Weight\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        app.navigationBars["Progress"].buttons["Home"].tap()
        app.buttons["My Meals "].tap()
        app.buttons["Vegan "].tap()
        app.buttons["None "].tap()
        app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["Protein pancakes"]/*[[".cells.staticTexts[\"Protein pancakes\"]",".staticTexts[\"Protein pancakes\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.textViews.staticTexts["2. For the blueberry chia jam: 200g blueberries, 2 tbsp chia seeds, 1-2 tbsp maple syrup, 2 tsp lemon juice"].swipeUp()
        element2.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeDown()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        app.navigationBars["None"].buttons["Vegan"].tap()
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["mySteps"].tap()
        tabBar.buttons["BMI"].tap()
        element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeRight()
        app.sliders["25%"].swipeRight()
        app.sliders["1%"].swipeRight()
        app.sliders["4%"].swipeRight()
        app.sliders["48%"].swipeRight()
        app.buttons["Calculate"].tap()
        
        let myworkoutsButton = tabBar.buttons["myWorkouts"]
        myworkoutsButton.tap()
        myworkoutsButton.tap()
        app.buttons["LoseWeightButton"].tap()
        app.buttons["Beginner"].tap()
        
        let homeButton = tabBar.buttons["Home"]
        homeButton.tap()
        homeButton.tap()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                                                XCUIApplication().launch()
                                
            }
        }
    }
}
