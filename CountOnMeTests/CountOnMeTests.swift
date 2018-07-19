//
//  CountOnMeTests.swift
//  CountOnMeTests
//
//  Created by Nicolas on 26/06/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//
// When:
// Given:
// Then:

import XCTest
@testable import CountOnMe

class CountOnMeTests: XCTestCase {
    var calcul = CalculManager()

    override func setUp() {
        super.setUp()
        calcul = CalculManager()
    }
    
    func test_WhenAddSigne() {
        // When: Add Signe
        // Then: Operator Is The Same
        let plus = "+"
        
        calcul.addOperator(withThis: "+")
        
        XCTAssertEqual(plus, calcul.getOperator)
    }

    func test_WhenAddOneNumber() {
        // When: Add One Number
        // Then: Previous Number Is The Same
        let nb1 = 2

        calcul.addCurrentNumber(with: nb1)

        XCTAssertEqual(Double(nb1), calcul.getPreviousNumber)
    }

    func test_WhenCurrentNumberIsNil() {
        // When: Current Number
        // Given: Nothing
        // Then: CurrentNumber Is Nil
        XCTAssertNil(calcul.currentNumber)
    }
    
    func test_WhenCalculIsEndend() {
        // When: Calcul Is Endend
        // Then: Displaed Number Is Remove
        calcul.isEnded = true
        let calc = calcul.isEnded
        
        XCTAssert(calc)
    }
    
    func test_WhenTryToDivideWithZero() {
        // When: Try To Divide With Zero
        // Then: Calcul Cant go And CheckIfDivideWithZero is false
        calcul.addCurrentNumber(with: 3)
        calcul.addOperator(withThis: "/")
        calcul.addCurrentNumber(with: 0)
        calcul.updateResult()

        XCTAssertFalse(calcul.checkIfDiviseWithZero)
    }
    
    func test_WhenTryToStartNewCalc_ThenAllAreReset() {
        // When: Try To Start New Calc
        // Then: All Are Reset
        calcul.addOperator(withThis: "")
        calcul.isFirstStep = true
        calcul.currentNumber = nil
        
        XCTAssertTrue(calcul.checkFirstStep)
        
        calcul.isFirstStep = false
        XCTAssertFalse(calcul.checkFirstStep)
    }
    
}
