//
//  CountOnMeTests.swift
//  CountOnMeTests
//
//  Created by Nicolas on 26/06/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CountOnMeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    func testCreatClass() {
        let unModel = CalulModel()
        XCTAssertNotNil(unModel)
    }
    
    
    
    
}
