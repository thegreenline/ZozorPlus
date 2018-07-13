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
    let nb1 = 2
    let nb2 = 3
    
    func addManyNumbers(from fromNumber:Int, to toNumber:Int) -> Double {
        var current = 0.0
        calcul.isFirstStep = true
        for number in fromNumber...toNumber {
            calcul.addCurrentNumber(number)
            calcul.isFirstStep = false
            current = current * 10 + Double(number)
        }
        return current
    }
    
    func calculManyNumbers(manyEnd1: Int, manyEnd2: Int, operateur: String) -> Double {
        let many1 = addManyNumbers(from: 1, to: manyEnd1)
        calcul.addOperator(signe: operateur)
        calcul.updateResult()
        let many2 = addManyNumbers(from: 1, to: manyEnd2)
        let operateur = operateur
        calcul.updateResult()
        
        var result = 0.0
        switch operateur {
        case "+": result = many1 + many2
        case "-": result = many1 - many2
        case "/": result = many1 / many2
        case "*": result = many1 * many2
        default: break
        }
        return Double(result)
    }
    
    override func setUp() {
        super.setUp()
        calcul = CalculManager()
        manager = ViewControllerManager()
        
    }

    func testClass() {
        XCTAssertNotNil(calcul)
    }
    
    func testSigne() {
        let plus = "+"
        
        calcul.addOperator(signe: "+")
        
        XCTAssertEqual(plus, calcul.getOperator)
    }

    func testAddNumber() {
        calcul.addCurrentNumber(nb1)

        XCTAssertEqual(Double(nb1), calcul.getPreviousNumber)
    }

//    func testGivenJustOneNumber_whenAddAnotherNumber_thenHaveBigNumber() {
//
//        let many1 = addManyNumbers(from: 1, to: 3)
//        calcul.updateResult()
//
//        XCTAssertEqual(calcul.getSetCurrentNumber, many1)
//        XCTAssertNotNil(calcul.getSetCurrentNumber)
//    }
    
    func testCurrentNumberReturnNilOnStart() {
        XCTAssertNil(calcul.getSetCurrentNumber)
    }
    
    func testAddOperator() {
        calcul.addOperator(signe: "+")
        
        XCTAssertEqual(calcul.getOperator, "+")
    }
    
//    func testIfFirstClaculIsOver_ThenCurrentNumberIs0() {
//        let result = calculManyNumbers(manyEnd1: 1, manyEnd2: 1, operateur: "+")
//
//        
//        XCTAssertEqual(calcul.getPreviousNumber, result)
//        XCTAssertEqual(calcul.getSetCurrentNumber, nil)
//    }
    
    func testWhenCalculIsEndend_ThenDisplaedNumberIsRemove() {
        // FIXME: lier ca avec le manager et pas le VC
        calcul.isEnded = true
        let calc = calcul.isEnded
        
        XCTAssert(calc)
        
//        XCTAssertEqual(view.getDisplayNumbers, "")
    }
    
//    func testGivenManyNumbers_WhenCalculCleared_ThenOperatorAndTotalReset() {
//        let many1 = addManyNumbers(from: 1, to: 3)
//        calcul.addOperator(signe: "+")
//        calcul.updateResult()
//        let many2 = addManyNumbers(from: 1, to: 1)
//        let result = many1 + many2
//        calcul.updateResult()
//
//        XCTAssertEqual(calcul.returnTotal, result)
//        calcul.clear()
//
//        XCTAssertEqual(calcul.getOperator, "")
//        XCTAssertEqual(calcul.getTotal, 0)
//    }

//    func testAllSignes() {
//        let tabSignes = ["+", "-", "/", "*", ""]
//        for signe in tabSignes {
//            calcul.clear()
//            let result = calculManyNumbers(manyEnd1: 2, manyEnd2: 3, operateur: signe)
//
//            XCTAssertEqual(calcul.returnTotal, result)
//        }
//    }
    
//    func testTotalMinus() {
//        let many1 = addManyNumbers(from: 1, to: 3)
//        calcul.addOperator(signe: "-")
//        calcul.updateResult()
//        let many2 = addManyNumbers(from: 1, to: 1)
//        let result = many1 - many2
//
//        XCTAssertEqual(calcul.returnTotal, result)
//        XCTAssertEqual(calcul.getSetCurrentNumber, 0)
//    }
    
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
        calcul.getSetCurrentNumber = nil
        
        XCTAssertTrue(calcul.checkFirstStep)
        
        calcul.isFirstStep = false
        XCTAssertFalse(calcul.checkFirstStep)
    }
    
}
