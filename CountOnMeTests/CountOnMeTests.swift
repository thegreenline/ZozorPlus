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
    var calcul = CalculManager()
    var manager = ViewControllerManager()

    override func setUp() {
        super.setUp()
        calcul = CalculManager()
        manager = ViewControllerManager()
        
    }
    
    func testSigne() {
        let plus = "+"
        
        calcul.addOperator(signe: "+")
        
        XCTAssertEqual(plus, calcul.getOperator)
    }

    func testAddNumber() {
        let nb1 = 2

        calcul.addCurrentNumber(nb1)

        XCTAssertEqual(Double(nb1), calcul.getPreviousNumber)
    }

    func testCurrentNumberReturnNilOnStart() {
        XCTAssertNil(calcul.currentNumber)
    }
    
    func testAddOperator() {
        calcul.addOperator(signe: "+")
        
        XCTAssertEqual(calcul.getOperator, "+")
    }
    
    func testWhenCalculIsEndend_ThenDisplaedNumberIsRemove() {
        calcul.isEnded = true
        let calc = calcul.isEnded
        
        XCTAssert(calc)
    }
    
    func testCanDivideWithZero () {
        calcul.addCurrentNumber(3)
        calcul.addOperator(signe: "/")
        calcul.addCurrentNumber(0)
        calcul.updateResult()

        XCTAssertFalse(calcul.checkIfDiviseWithZero)
    }
    
    func testStartNewCalc() {
        calcul.addOperator(signe: "")
        calcul.isFirstStep = true
        calcul.currentNumber = nil
        
        XCTAssertTrue(calcul.checkFirstStep)
        
        calcul.isFirstStep = false
        XCTAssertFalse(calcul.checkFirstStep)
    }
    
}
