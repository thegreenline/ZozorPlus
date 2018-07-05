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
    
    func addManyNumbers(from fromNumber:Int, to toNumber:Int) {
        for number in fromNumber...toNumber {
            test.addCurrentNumber(number)
        }
    }
    
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
        
        XCTAssertEqual(plus, test.getOperator)
    }

    func testAddNumber() {
        test.addCurrentNumber(nb1)

        XCTAssertEqual(Double(nb1), test.getCurrentNumber)
    }

    func testGivenJustOneNumber_whenAddAnotherNumber_thenHaveBigNumber() {

        addManyNumbers(from: 1, to: 4)
        
        XCTAssertEqual(test.getCurrentNumber, 1234)
    }
    
    func testAddOperator() {
        test.addOperator(signe: "+")
        
        XCTAssertEqual(test.getOperator, "+")
    }
    
    func testGivenHaveTowNumber_WhenStartCalcul_ThenResultatCorrect() {
        //
    }
    
    func testGivenHaveManyNumbers_WhenStartCalcul_ThenResultCorrrect() {
        //
    }
    
//    func testTotalPlus() {
//        // add comment
//        test.addOperator(signe: "+")
//        test.addNewNumber(1)
//        test.addOperator(signe: "+")
//        test.addNewNumber(2)
//
//        XCTAssertEqual(test.getTotal, 3)
//    }
//    func testTotalMinus() {
//        test.addOperator(signe: "+")
//        test.addNewNumber(1)
//        test.addOperator(signe: "-")
//        test.addNewNumber(2)
//
//        XCTAssertEqual(test.getTotal, -1)
//    }
//    func testTotalMulti() {
//        test.addOperator(signe: "+")
//        test.addNewNumber(1)
//        test.addOperator(signe: "*")
//        test.addNewNumber(2)
//        
//        XCTAssertEqual(test.getTotal, 2)
//    }
//    func testTotalDivide() {
//        test.addOperator(signe: "+")
//        test.addNewNumber(2)
//        test.addOperator(signe: "/")
//        test.addNewNumber(2)
//
//        XCTAssertEqual(test.getTotal, 1)
//    }
//    
//    func testTotalDefault() {
//        test.addOperator(signe: "+")
//        test.addNewNumber(2)
//        test.addOperator(signe: "n")
//        test.addNewNumber(2)
//
//        XCTAssertEqual(test.getTotal, 2)
//    }
//
//    func testClear() {
//        test.addOperator(signe: "+")
//        test.addNewNumber(2)
//        test.addOperator(signe: "n")
//        test.addNewNumber(2)
//
//        test.clear()
//
//        XCTAssertEqual(test.getStringNumbers, [""])
//        XCTAssertEqual(test.getOperator, ["+"])
//        XCTAssert(test.getTotal == 0)
//    }
    
}
