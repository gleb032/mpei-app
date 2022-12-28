//
//  mpei_appUITests.swift
//  mpei-appUITests
//
//  Created by Глеб Фандеев on 18.12.2022.
//

import XCTest

final class mpei_appUITests: XCTestCase {
    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testTabBarProfessorsButton() {
        let tabBarsQuery = XCUIApplication().tabBars
        let button = tabBarsQuery.buttons["Преподаватели"]
        XCTAssertTrue(button.exists)
        button.tap()
    }

    func testTabBarMapButton() {
        let tabBarsQuery = XCUIApplication().tabBars
        let button = tabBarsQuery.buttons["Карта корпусов"]
        XCTAssertTrue(button.exists)
        button.tap()
    }
}
