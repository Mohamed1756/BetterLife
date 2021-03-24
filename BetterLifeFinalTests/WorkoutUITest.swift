//
//  WorkoutUITest.swift
//  BetterLifeFinalTests
//
//  Created by Mohamed on 24/03/2021.
//

import XCTest
@testable import BetterLifeFinal

class WorkoutUITest: XCTestCase {
    
    // Test that text label is connected
    
    func test_Workout_TextLabels () {
        
        let storyboard = UIStoryboard(name: "MyFitnessGoalScreen", bundle: nil)
        let myWorkouts = storyboard.instantiateViewController(withIdentifier: "workoutScreenHome") as!MyWorkoutsChoiceView
                   
        let _ = myWorkouts.view
        
        
        XCTAssertEqual("Lose Weight", myWorkouts.loseWeightTextLabel!.text)
        XCTAssertEqual("Build Muscle", myWorkouts.buildMuscleTextLabel!.text)
        XCTAssertEqual("Stay Fit", myWorkouts.stayFitTextLabel!.text)
        XCTAssertEqual("What Are Your Fitness Goals ?", myWorkouts.workoutChoiceTextLabel!.text)
    }
    
    func test_Workout_BuildMuscle_Buttons(){
        let storyboard = UIStoryboard(name: "BuildMuscleScreen", bundle: nil)
        let buildMuscle = storyboard.instantiateViewController(identifier: "buildMuscleScreenHome") as! BuildMuscleView
        let _ = buildMuscle.view
        
        // test if buttons are connected
        
        let beginnerButton:UIButton = buildMuscle.beginnerButton
        let intermediateButton:UIButton = buildMuscle.intermediateButton
        let advancedButton:UIButton = buildMuscle.advancedButton
        
        XCTAssertNotNil(beginnerButton, "The Screen does not have a Beginner button ")
        XCTAssertNotNil(intermediateButton, "The Screen does not have a Intermediate button ")
        XCTAssertNotNil(advancedButton, "The Screen does not have a Advanced button ")
        
    }
    
    func test_LoseWeight_Buttons () {
        
        let storyboard = UIStoryboard(name: "LoseWeightScreen", bundle: nil)
        let loseWeight = storyboard.instantiateViewController(identifier: "loseWeightScreenHome") as! LoseWeightScreen
        let _ = loseWeight.view
        
        // testing if title connected
        XCTAssertEqual("What is your Fitness Level ?, select your preference", loseWeight.titleText!.text)
        
        // test Buttons
        let beginnerButton:UIButton = loseWeight.beginnerButton
        let intermediateButton:UIButton = loseWeight.intermediateButton
        let advancedButton:UIButton = loseWeight.advancedButton
        
        XCTAssertNotNil(beginnerButton, "The Screen does not have a Beginner button ")
        XCTAssertNotNil(intermediateButton, "The Screen does not have a Intermediate button ")
        XCTAssertNotNil(advancedButton, "The Screen does not have a Advanced button ")
        
    }
    
    func test_StayFit_Buttons() {

        let storyboard = UIStoryboard(name: "StayFitScreen", bundle: nil)
        let stayFit = storyboard.instantiateViewController(identifier: "stayFitScreenHome") as! StayFitView
        let _ = stayFit.view
        
        // testing if title connected
        XCTAssertEqual("What is your Fitness Level ?, select your preference", stayFit.textTitle.text)
        
        // test Buttons
        let beginnerButton:UIButton = stayFit.beginnerButton
        let intermediateButton:UIButton = stayFit.intermediateButton
        let advancedButton:UIButton = stayFit.advancedButton
        
        XCTAssertNotNil(beginnerButton, "The Screen does not have a Beginner button ")
        XCTAssertNotNil(intermediateButton, "The Screen does not have a Intermediate button ")
        XCTAssertNotNil(advancedButton, "The Screen does not have a Advanced button ")
    }
    
}
