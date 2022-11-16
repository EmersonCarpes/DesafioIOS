//
//  DesafioIOSTestCase.swift
//  DesafioIOSUITests
//
//  Created by Emerson Carpes on 15/11/22.
//

import XCTest

class DesafioIOSTestCase: XCTestCase {
    let app = XCUIApplication()
    static var isLaunch = false

    override func setUp() {
        super.setUp()
        continueAfterFailure = false

        if !DesafioIOSTestCase.isLaunch {
            app.launch()
            DesafioIOSTestCase.isLaunch = true
        }
    }

    override func tearDown() {
        super.tearDown()
    }
    
    @discardableResult func wait(forElement element: XCUIElement, timeout: TimeInterval = 20) -> XCTWaiter.Result {
        let exists = NSPredicate(format: "exists == true")
        let expec = expectation(for: exists, evaluatedWith: element)
        let result = XCTWaiter().wait(for: [expec], timeout: timeout)
        return result
    }
}
