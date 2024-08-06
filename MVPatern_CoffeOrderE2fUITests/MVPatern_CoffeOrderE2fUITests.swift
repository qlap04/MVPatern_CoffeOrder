//
//  MVPatern_CoffeOrderE2fUITests.swift
//  MVPatern_CoffeOrderE2fUITests
//
//  Created by Phan Quốc Lập on 06/08/2024.
//

import XCTest

final class when_app_is_launded_without_orders: XCTestCase {

   
    func test_should_make_sure_no_orders_message_is_displayed() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launchEnvironment = ["ENV": "TEST"]
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual("No orders available!", app.staticTexts["noOrderText"].label)
    }

    
}
