//
//  DesafioIOSUITests.swift
//  DesafioIOSUITests
//
//  Created by Emerson Carpes on 13/11/22.
//

import XCTest

final class DesafioIOSUITests: DesafioIOSTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }
    
    func testTapItem() {
        let firstCell = app.collectionViews["moviesCollection"].cells.firstMatch
        wait(forElement: firstCell)
        firstCell.tap()
        XCTAssertTrue(app.staticTexts["nameLabel"].exists)
    }
    
    func testBackButtonFromMovieDetails() {
        let firstCell = app.collectionViews["moviesCollection"].cells.firstMatch
        wait(forElement: firstCell)
        firstCell.tap()
        app.navigationBars.buttons.element(boundBy: 0).tap()
        XCTAssertTrue(app.collectionViews["moviesCollection"].cells.firstMatch.exists)
        
    }
    
    func testSearchByTitle() {
        wait(forElement: app.searchFields.firstMatch)
        app.searchFields.firstMatch.tap()
        app.searchFields.firstMatch.typeText("X-")
        wait(forElement: app.collectionViews["searchCollection"].cells.firstMatch)
        XCTAssertTrue(app.collectionViews["searchCollection"].cells.firstMatch.exists)
    }
}
