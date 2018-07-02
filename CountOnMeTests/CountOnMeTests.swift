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
    var test = CalculManager()
    let nb1 = 2
    let nb2 = 3
    
    override func setUp() {
        super.setUp()
        test = CalculManager()
    }
    
    func testClass() {
        XCTAssertNotNil(test)
    }
    
    func testSigne() {
        let plus = "+"
        
        test.addOperator(signe: "+")
        
        XCTAssertEqual(plus, test.getOperator.last)
    }
    
    func testAddNumber() {
        test.addNewNumber(nb1)
        
        XCTAssertEqual(String(nb1), test.getStringNumbers.last)
    }
    
    func testTotalPlus() {
        // add comment
        test.addOperator(signe: "+")
        test.addStringNumbers(number: "1")
        test.addOperator(signe: "+")
        test.addStringNumbers(number: "2")
        
        XCTAssertEqual(test.getTotal, 3)
    }
    func testTotalMinus() {
        test.addOperator(signe: "+")
        test.addStringNumbers(number: "1")
        test.addOperator(signe: "-")
        test.addStringNumbers(number: "2")
        
        XCTAssertEqual(test.getTotal, -1)
    }
    func testTotalMulti() {
        test.addOperator(signe: "+")
        test.addStringNumbers(number: "1")
        test.addOperator(signe: "*")
        test.addStringNumbers(number: "2")
        
        XCTAssertEqual(test.getTotal, 2)
    }
    func testTotalDivide() {
        test.addOperator(signe: "+")
        test.addStringNumbers(number: "2")
        test.addOperator(signe: "/")
        test.addStringNumbers(number: "2")
        
        XCTAssertEqual(test.getTotal, 1)
    }
    
    func testTotalDefault() {
        test.addOperator(signe: "+")
        test.addStringNumbers(number: "2")
        test.addOperator(signe: "n")
        test.addStringNumbers(number: "2")
        
        XCTAssertEqual(test.getTotal, 2)
    }
    
    func testClear() {
        test.addOperator(signe: "+")
        test.addStringNumbers(number: "2")
        test.addOperator(signe: "n")
        test.addStringNumbers(number: "2")
        
        test.clear()
        
        XCTAssertEqual(test.getStringNumbers, [""])
        XCTAssertEqual(test.getOperator, ["+"])
        XCTAssert(test.getTotal == 0)
    }
    
}
