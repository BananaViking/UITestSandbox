//
//  XCUITestSandboxUITests.swift
//  XCUITestSandboxUITests
//
//  Created by Banana Viking on 1/24/19.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import XCTest

class XCUITestSandboxUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        let app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLabelCopiesTextField() {
        
        let app = XCUIApplication()
        app.textFields.element.tap()
        
        app.keys["t"].tap()
        app.keys["e"].tap()
        app.keys["s"].tap()
        app.keys["t"].tap()
        app.keyboards.buttons["Return"].tap()
        
        XCTAssertEqual(app.staticTexts["TextCopy"].label, "test")
    }
    
    func testSliderControlsProgress() {
        let app = XCUIApplication()
        app.sliders["Completion"].adjust(toNormalizedSliderPosition: 1)
        
        guard let completion = app.progressIndicators.element.value as? String else {
            XCTFail("Unable to find the progress indicator.")
            return
        }
        
        XCTAssertEqual(completion, "0%")
    }
    
    func testButtonsShowAlerts() {
        let app = XCUIApplication()
        app.buttons["Blue"].tap()
        XCTAssertTrue(app.alerts["Blue"].exists)
        app.alerts["Blue"].buttons["OK"].tap()
    }
    
    func testSegmentedControl() {
        let app = XCUIApplication()
        app.segmentedControls.buttons["Omega"].tap()
        
        XCTAssert(app.staticTexts["Omega"].exists)
    }

}
