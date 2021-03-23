//
//  otherFeaturesTests.swift
//  BetterLifeFinalTests
//
//  Created by Mohamed on 22/03/2021.
//

import XCTest
@testable import BetterLifeFinal

class otherFeaturesTest: XCTestCase {
    

    func test_Text_Titles() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myMeals = storyboard.instantiateViewController(withIdentifier: "myMealsScreen") as! MyMeals
                   
        let _ = myMeals.view
                    
        XCTAssertEqual("Any Dietry", myMeals.firstLineTitle!.text)
        XCTAssertEqual("Requirements", myMeals.requirementsTextLabel!.text)
                    
    }
    
    func test_Progress_Screen_Placeholders() {
        let storyboard = UIStoryboard(name: "HomeScreen", bundle: nil)
        let progressScreenView = storyboard.instantiateViewController(withIdentifier: "progressScreenHome") as! EditProfileView
        let _ = progressScreenView.view
        // test if the question display 3 options
        XCTAssertEqual(3, progressScreenView.weightGoalsList.count)
        
        // Test if textfields displays correct placeholders.
        XCTAssertEqual("Weight Goal", progressScreenView.weightGoalTextField!.placeholder)
        XCTAssertEqual("Target Weight (Kg)", progressScreenView.targetWeightTextField.placeholder)
        XCTAssertEqual("Current Weight (Kg)", progressScreenView.currentWeightTextField.placeholder)
        
        
        
    }
    func test_Progress_Screen_Varibles () {
        let storyboard = UIStoryboard(name: "HomeScreen", bundle: nil)
        let progressScreenView = storyboard.instantiateViewController(withIdentifier: "progressScreenHome") as! EditProfileView
        let _ = progressScreenView.view
        
        // Testing Flag Varible
        
        XCTAssert(progressScreenView.flag == 0)
        
    }
    
    func test_Progress_Screen_Textfields () throws {
        let storyboard = UIStoryboard(name: "HomeScreen", bundle: nil)
        let progressScreenView = storyboard.instantiateViewController(withIdentifier: "progressScreenHome") as! EditProfileView
        let _ = progressScreenView.view
        
        let weightTextfield = try XCTUnwrap(progressScreenView.currentWeightTextField, "This textField is not connected to app")
        
        XCTAssertTrue(weightTextfield.allowsEditingTextAttributes, "User can input text")
        
        let targetWeightTextField = try XCTUnwrap(progressScreenView.targetWeightTextField, "This textField is not connected to app")
        
        XCTAssertTrue(targetWeightTextField.allowsEditingTextAttributes, "User can input text")
        
        let scrollTextField = try XCTUnwrap(progressScreenView.weightGoalPickerView, "Picker View is not connected ")
        
        XCTAssertTrue(scrollTextField.accessibilityRespondsToUserInteraction, "picker view feature works")
        
    }
    
    func test_Mealbutton_is_Connected () {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myMeals = storyboard.instantiateViewController(withIdentifier: "myMealsScreen") as! MyMeals
                   
        let _ = myMeals.view
        
        let noneButton:UIButton = myMeals.noDietryRequirementsButton
        let glutenFreeButton:UIButton = myMeals.toGlutenFreeButton
        let vegetarianButton:UIButton = myMeals.toVegetarianButton
        let veganButton:UIButton = myMeals.toVeganButton
        let pescButton:UIButton = myMeals.toPescatarianButton
        
        XCTAssertNotNil(noneButton, "The Screen does not have a none button ")
        XCTAssertNotNil(glutenFreeButton, "The Screen does not have a glutenFree button ")
        XCTAssertNotNil(vegetarianButton, "The Screen does not have a vegetarian button ")
        XCTAssertNotNil(veganButton, "The Screen does not have a vegan button ")
        XCTAssertNotNil(pescButton, "The Screen does not have a pescatarian button ")
    }
    
}
