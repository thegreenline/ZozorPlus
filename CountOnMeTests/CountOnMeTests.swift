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
    var view = ViewController()
    let nb1 = 2
    let nb2 = 3
    
    func addManyNumbers(from fromNumber:Int, to toNumber:Int) -> Double {
        var current = 0.0
        for number in fromNumber...toNumber {
            test.addCurrentNumber(number)
            current = current * 10 + Double(number)
        }
        return current
    }
    
    func calculManyNumbers(manyEnd1: Int, manyEnd2: Int, operateur: String) -> Double {
        let many1 = addManyNumbers(from: 1, to: manyEnd1)
        test.addOperator(signe: operateur)
        test.updateResult()
        let many2 = addManyNumbers(from: 1, to: manyEnd2)
        let operateur = operateur
        
        
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
        test = CalculManager()
        view = ViewController()
        
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

        let many1 = addManyNumbers(from: 1, to: 4)
        
        XCTAssertEqual(test.getCurrentNumber, many1)
    }
    
    func testAddOperator() {
        test.addOperator(signe: "+")
        
        XCTAssertEqual(test.getOperator, "+")
    }
    
    func testIfFirstClaculIsOver_ThenCurrentNumberIs0() {
        let result = calculManyNumbers(manyEnd1: 1, manyEnd2: 1, operateur: "+")

        
        XCTAssertEqual(test.getTotal, result)
        XCTAssertEqual(test.getCurrentNumber, 0)
    }
    
    func testWhenCalculIsEndend_ThenDisplaedNumberIsRemove() {
        test.isEnded = true
        let calc = test.isEnded
        
        XCTAssert(calc)
        
        XCTAssertEqual(view.getDisplayNumbers, "")
    }
    
    func testGivenManyNumbers_WhenCalculCleared_ThenOperatorAndTotalReset() {
        let many1 = addManyNumbers(from: 1, to: 3)
        test.addOperator(signe: "+")
        test.updateResult()
        let many2 = addManyNumbers(from: 1, to: 1)
        let result = many1 + many2
        
        XCTAssertEqual(test.getTotal, result)
        test.clear()
        
        XCTAssertEqual(test.getOperator, "")
        XCTAssertEqual(test.getTotal, 0)
    }

    func testAllSignes() {
        let tabSignes = ["+", "-", "/", "*", ""]
        for signe in tabSignes {
            test.clear()
            let result = calculManyNumbers(manyEnd1: 2, manyEnd2: 3, operateur: signe)
            
            XCTAssertEqual(test.getTotal, result)
            XCTAssertEqual(test.returnTotal, result)
        }
    }
    func testTotalMinus() {
        let many1 = addManyNumbers(from: 1, to: 3)
        test.addOperator(signe: "-")
        test.updateResult()
        let many2 = addManyNumbers(from: 1, to: 1)
        let result = many1 - many2
        
        XCTAssertEqual(test.getTotal, result)
        XCTAssertEqual(test.getCurrentNumber, 0)
    }
    
    func testCanDivideWithZero () {
        test.addCurrentNumber(3)
        test.addOperator(signe: "/")
        test.addCurrentNumber(0)
        test.updateResult()

        XCTAssertTrue(test.checkIfDiviseWithZero)
    }
    
    func testStartNewCalc() {
        test.firstStep = false
        
        XCTAssertTrue(test.checkFirstStet)
    }
    
}
