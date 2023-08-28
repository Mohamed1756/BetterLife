import XCTest
@testable import BetterLifeFinal

class HomeScreenTests:XCTestCase {
    // test cases for the Home screen

    let storyboard = UIStoryboard(name: "HomeScreen", bundle: nil)
    
    func home_Screen_progressButtons_Test(){
        
        let homeScreen = storyboard.instantiateViewController(withIdentifier: "UIViewController-b3C-ne-AFi") as! HomeScreenVIew
        let _ = homeScreen.view
        
        let progressButton:UIButton = homeScreen.progressScreenText
        
     guard let progressButtonAction = progressButton.actions(forTarget: homeScreen, forControlEvent: .touchUpInside) else {
             XCTFail("UIButton does not have actions assigned for Control Event .touchUpInside")
             return
         }
        XCTAssertTrue(progressButtonAction.contains("Progress button pressed:"))
          
        
        let bmiButton:UIButton = homeScreen.BmiText
        
        guard let bmiButtonAction = bmiButton.actions(forTarget: homeScreen, forControlEvent: .touchUpInside) else {
           
            XCTFail("UIButton does not have actions assigned for Control Event .touchUpInside")
            return
        }
        XCTAssertTrue(bmiButtonAction.contains("BMI button pressed:"))
    
    }
    
    func home_Screen_myMeals_Button (){
        
        let homeScreen = storyboard.instantiateViewController(withIdentifier: "UIViewController-b3C-ne-AFi") as! HomeScreenVIew
        let _ = homeScreen.view
        
        let myMealsButton:UIButton = homeScreen.myMealsText
        
        guard let myMealsButtonAction = myMealsButton.actions(forTarget: homeScreen, forControlEvent: .touchUpInside) else {
           
            XCTFail("UIButton does not have actions assigned for Control Event .touchUpInside")
            return
        }
        XCTAssertTrue(myMealsButtonAction.contains("Progress button pressed:"))
        
    }
    
    func home_Screen_Workouts_Button() {
        
        let homeScreen = storyboard.instantiateViewController(withIdentifier: "UIViewController-b3C-ne-AFi") as! HomeScreenVIew
        let _ = homeScreen.view
        
        let myWorkoutsButton:UIButton = homeScreen.myWorkoutText
        
        guard let myWorkoutsButtonAction = myWorkoutsButton.actions(forTarget: homeScreen, forControlEvent: .touchUpInside) else {
           
            XCTFail("UIButton does not have actions assigned for Control Event .touchUpInside")
            return
        }
        XCTAssertTrue(myWorkoutsButtonAction.contains("workout button pressed:"))
        
    }
    
    func home_Screen_mySteps_Button () {
        
        let homeScreen = storyboard.instantiateViewController(withIdentifier: "UIViewController-b3C-ne-AFi") as! HomeScreenVIew
        let _ = homeScreen.view
        
        let myStepsButton:UIButton = homeScreen.myStepsText
        
        guard let myStepsButtonAction = myStepsButton.actions(forTarget: homeScreen, forControlEvent: .touchUpInside) else {
           
            XCTFail("UIButton does not have actions assigned for Control Event .touchUpInside")
            return
        }
        XCTAssertTrue(myStepsButtonAction.contains("My steps button pressed:"))
        
    }
}

