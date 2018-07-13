//
//  ManagerTests.swift
//  CountOnMeTests
//
//  Created by Nicolas on 11/07/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class ManagerTests: XCTestCase {
    var manager = ViewControllerManager()
    
    override func setUp() {
        super.setUp()
        manager = ViewControllerManager()
    }
    
    func testCreateObjet() {
        XCTAssertNotNil(manager)
    }
    
    func testAddition() {
        let nb1 = 1
        let nb2 = 1
        var result = 0.0
        
        manager.keypadBtn(senderTag: nb1)
        manager.plusBtn()
        manager.keypadBtn(senderTag: nb2)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) + Double(nb2)
        
        XCTAssert(result == total)
        XCTAssert(manager.getCodeErreur == nil)
    }
    
    func testMinus() {
        let nb1 = 1
        let nb2 = 1
        var result = 0.0
        
        manager.keypadBtn(senderTag: nb1)
        manager.minusBtn()
        manager.keypadBtn(senderTag: nb2)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) - Double(nb2)
        
        XCTAssertEqual(result, total)
        XCTAssert(manager.getCodeErreur == nil)
    }
    
    func testMultiply() {
        let nb1 = 2
        let nb2 = 2
        var result = 0.0
        
        manager.keypadBtn(senderTag: nb1)
        manager.multiplyBtn()
        manager.keypadBtn(senderTag: nb2)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) * Double(nb2)
        
        XCTAssertEqual(result, total)
        XCTAssert(manager.getCodeErreur == nil)
    }
    
    func testDivide() {
        let nb1 = 2
        let nb2 = 2
        var result = 0.0
        
        manager.keypadBtn(senderTag: nb1)
        manager.divideBtn()
        manager.keypadBtn(senderTag: nb2)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) / Double(nb2)
        
        XCTAssertEqual(result, total)
        XCTAssert(manager.getCodeErreur == nil)
    }
    
    func testCalculSequence() {
        let nb1 = 1
        let nb2 = 2
        let nb3 = 4
        let nb4 = 6
        var result = 0.0
        
        manager.keypadBtn(senderTag: nb1)
        manager.keypadBtn(senderTag: nb4)
        manager.plusBtn()
        manager.keypadBtn(senderTag: nb2)
        manager.minusBtn()
        manager.keypadBtn(senderTag: nb3)

        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1 * 10 + nb4) + Double(nb2) - Double(nb3)
        
        XCTAssertEqual(result, total)
        XCTAssert(manager.getCodeErreur == nil)
    }
    
    func testAllOperatorsSequenceAndChainCalc() {
        let nb1 = 1
        let nb2 = 2
        let nb3 = 4
        let nb4 = 6
        let nb5 = 3
        let nb6 = 2
        var result = 0.0
        
        manager.keypadBtn(senderTag: nb1)
        manager.keypadBtn(senderTag: nb4)
        manager.plusBtn()
        manager.keypadBtn(senderTag: nb2)
        manager.minusBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.multiplyBtn()
        manager.keypadBtn(senderTag: nb5)
        manager.divideBtn()
        manager.keypadBtn(senderTag: nb6)
        manager.equalBtn()
        
        manager.plusBtn()
        manager.keypadBtn(senderTag: nb1)
        manager.keypadBtn(senderTag: nb2)
        manager.equalBtn()
        
        manager.minusBtn()
        manager.keypadBtn(senderTag: nb2)
        manager.keypadBtn(senderTag: nb1)
        manager.equalBtn()
        
        manager.multiplyBtn()
        manager.keypadBtn(senderTag: nb1)
        manager.keypadBtn(senderTag: nb2)
        manager.equalBtn()
        
        manager.divideBtn()
        manager.keypadBtn(senderTag: nb5)
        manager.equalBtn()
        
        manager.keypadBtn(senderTag: nb1)
        manager.keypadBtn(senderTag: nb2)
        manager.multiplyBtn()
        manager.keypadBtn(senderTag: nb1)
        manager.keypadBtn(senderTag: nb2)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = (Double(16) + Double(nb2) - Double(nb3)) * Double(nb5) / Double(nb6)
        result = result + Double(12)
        result = result - Double(21)
        result = result * Double(12)
        result = result / Double(nb5)
        
        result = Double(12) * Double(12)
        
        XCTAssertEqual(result, total)
        XCTAssert(manager.getCodeErreur == nil)
    }
    
    func testAllOperatorsSequenceAndChainCalcWhithBigNumber() {
        let nb1 = 1
        let nb2 = 2
        let nb3 = 4
        let nb4 = 6
        let nb5 = 3
        let nb6 = 2
        var result = 0.0
        
        manager.keypadBtn(senderTag: nb1)
        manager.keypadBtn(senderTag: nb4)
        manager.plusBtn()
        manager.keypadBtn(senderTag: nb2)
        manager.keypadBtn(senderTag: nb2)
        manager.minusBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.keypadBtn(senderTag: nb3)
        manager.multiplyBtn()
        manager.keypadBtn(senderTag: nb5)
        manager.keypadBtn(senderTag: nb5)
        manager.divideBtn()
        manager.keypadBtn(senderTag: nb6)
        manager.keypadBtn(senderTag: nb6)
        manager.equalBtn()
        
        manager.plusBtn()
        manager.keypadBtn(senderTag: nb1)
        manager.keypadBtn(senderTag: nb2)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = (Double(16) + Double(22) - Double(44)) * Double(33) / Double(22)
        result = result + Double(12)
        
        XCTAssertEqual(result, total)
        XCTAssert(manager.getCodeErreur == nil)
    }

    func testAllOperatorsSequenceAndStartNewCalc() {
        let nb1 = 1
        let nb2 = 2
        let nb3 = 4
        let nb4 = 6
        let nb5 = 3
        let nb6 = 2
        var result = 0.0
        
        manager.keypadBtn(senderTag: nb1)
        manager.keypadBtn(senderTag: nb4)
        manager.plusBtn()
        manager.keypadBtn(senderTag: nb2)
        manager.minusBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.multiplyBtn()
        manager.keypadBtn(senderTag: nb5)
        manager.divideBtn()
        manager.keypadBtn(senderTag: nb6)
        manager.equalBtn()
        
        manager.keypadBtn(senderTag: nb1)
        manager.plusBtn()
        manager.keypadBtn(senderTag: nb2)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) + Double(nb2)
        
        XCTAssertEqual(result, total)
        XCTAssert(manager.getCodeErreur == nil)
    }
    
    func testOneDecimalSImpleCalculPlus() {
        let nb1 = 1
        let nb2 = 0
        let nb3 = 5
        var result = 0.0
        
        manager.keypadBtn(senderTag: nb1)
        manager.plusBtn()
        manager.keypadBtn(senderTag: nb2)
        manager.addCommaBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) + Double(0.5)
        
        XCTAssertEqual(result, total)
        XCTAssert(manager.getCodeErreur == nil)
    }
    
    func testOneDecimalSImpleCalculMinus() {
        let nb1 = 1
        let nb2 = 0
        let nb3 = 5
        var result = 0.0
        
        manager.keypadBtn(senderTag: nb1)
        manager.minusBtn()
        manager.keypadBtn(senderTag: nb2)
        manager.addCommaBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) - Double(0.5)
        
        XCTAssertEqual(result, total)
        XCTAssert(manager.getCodeErreur == nil)
    }
    
    func testOneDecimalSImpleCalculDivide() {
        let nb1 = 1
        let nb2 = 0
        let nb3 = 5
        var result = 0.0
        
        manager.keypadBtn(senderTag: nb1)
        manager.divideBtn()
        manager.keypadBtn(senderTag: nb2)
        manager.addCommaBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) / Double(0.5)
        
        XCTAssertEqual(result, total)
        XCTAssert(manager.getCodeErreur == nil)
    }
    
    func testOneDecimalComplexCalculDivide() {
        let nb1 = 1
        let nb2 = 0
        let nb3 = 2
        let nb4 = 5
        var result = 0.0
        
        manager.keypadBtn(senderTag: nb1)
        manager.divideBtn()
        manager.keypadBtn(senderTag: nb2)
        manager.addCommaBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.keypadBtn(senderTag: nb4)
        manager.keypadBtn(senderTag: nb3)
        manager.keypadBtn(senderTag: nb4)
        manager.keypadBtn(senderTag: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) / Double(0.25252)
        
        XCTAssertEqual(result, total)
        XCTAssert(manager.getCodeErreur == nil)
    }
    
    func testOneDecimalSImpleCalculMultiply() {
        let nb1 = 1
        let nb2 = 0
        let nb3 = 5
        var result = 0.0
        
        manager.keypadBtn(senderTag: nb1)
        manager.multiplyBtn()
        manager.keypadBtn(senderTag: nb2)
        manager.addCommaBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) * Double(0.5)
        
        XCTAssertEqual(result, total)
        XCTAssert(manager.getCodeErreur == nil)
    }
    
    func testOneDecimalMediumCalculOnlyPlus() {
        let nb1 = 1
        let nb2 = 0
        let nb3 = 5
        let nb4 = 2
        var result = 0.0
        
        manager.keypadBtn(senderTag: nb1)
        manager.plusBtn()
        manager.keypadBtn(senderTag: nb2)
        manager.addCommaBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.keypadBtn(senderTag: nb3)
        manager.plusBtn()
        manager.keypadBtn(senderTag: nb4)
        manager.minusBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) + Double(0.55) + Double(nb4) - Double(nb3)
        
        XCTAssertEqual(result, total)
        XCTAssert(manager.getCodeErreur == nil)
    }
    
    func testTwoDecimalSImpleCalcul() {
        let nb1 = 1
        let nb2 = 0
        let nb3 = 5
        var result = 0.0
        
        manager.keypadBtn(senderTag: nb1)
        manager.plusBtn()
        manager.keypadBtn(senderTag: nb2)
        manager.addCommaBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.keypadBtn(senderTag: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) + Double(0.55)
        
        XCTAssertEqual(result, total)
        XCTAssert(manager.getCodeErreur == nil)
    }
    
    
    func testBigNumberWithNotZeroDecimal() {
        let nb1 = 2
        let nb2 = 0
        let nb3 = 2
        let nb4 = 5
        var result = 0.0
        
        manager.keypadBtn(senderTag: nb1)
        manager.keypadBtn(senderTag: nb2)
        manager.plusBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.addCommaBtn()
        manager.keypadBtn(senderTag: nb4)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(20) + Double(2.5)
        
        XCTAssertEqual(result, total)
        XCTAssert(manager.getCodeErreur == nil)
    }
    
    func testBigNumberWithNotZeroDecimalMinus() {
        let nb1 = 2
        let nb2 = 0
        let nb3 = 2
        let nb4 = 5
        var result = 0.0
        
        manager.keypadBtn(senderTag: nb1)
        manager.keypadBtn(senderTag: nb2)
        manager.minusBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.addCommaBtn()
        manager.keypadBtn(senderTag: nb4)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(20) - Double(2.5)
        
        XCTAssertEqual(result, total)
        XCTAssert(manager.getCodeErreur == nil)
    }
    
    func testBigNumberWithNotZeroDecimalMultiply() {
        let nb1 = 2
        let nb2 = 0
        let nb3 = 2
        let nb4 = 5
        var result = 0.0
        
        manager.keypadBtn(senderTag: nb1)
        manager.keypadBtn(senderTag: nb2)
        manager.multiplyBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.addCommaBtn()
        manager.keypadBtn(senderTag: nb4)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(20) * Double(2.5)
        
        XCTAssertEqual(result, total)
        XCTAssert(manager.getCodeErreur == nil)
    }
    
    func testBigNumberWithNotZeroDecimalDivide() {
        let nb1 = 2
        let nb2 = 0
        let nb3 = 2
        let nb4 = 5
        var result = 0.0
        
        manager.keypadBtn(senderTag: nb1)
        manager.keypadBtn(senderTag: nb2)
        manager.divideBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.addCommaBtn()
        manager.keypadBtn(senderTag: nb4)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(20) / Double(2.5)
        
        XCTAssertEqual(result, total)
        XCTAssert(manager.getCodeErreur == nil)
    }
    
    func testAcFunction() {
        let nb1 = 1
        let nb2 = 0
        let nb3 = 5
        
        manager.keypadBtn(senderTag: nb1)
        XCTAssert(manager.getCalculInstance.isDecimal == false)
        manager.plusBtn()
        XCTAssert(manager.getCalculInstance.isDecimal == false)
        manager.keypadBtn(senderTag: nb2)
        XCTAssert(manager.getCalculInstance.isDecimal == false)
        manager.addCommaBtn()
        XCTAssert(manager.getCalculInstance.isDecimal == true)
        XCTAssert(manager.getCalculInstance.isTenOrSo == false)
        manager.keypadBtn(senderTag: nb3)
        XCTAssert(manager.getCalculInstance.isDecimal == true)
        XCTAssert(manager.getCalculInstance.isTenOrSo == true)
        manager.keypadBtn(senderTag: nb3)
        XCTAssert(manager.getCalculInstance.isDecimal == true)
        XCTAssert(manager.getCalculInstance.isTenOrSo == true)
        manager.equalBtn()
        XCTAssert(manager.getCalculInstance.isDecimal == false)
        XCTAssert(manager.getCalculInstance.isTenOrSo == false)

        manager.acBtn()
        
        let total = manager.getCalculInstance.returnTotal
        
        XCTAssertEqual(total, 0)
        XCTAssert(manager.getCalculInstance.isFirstStep == true)
        XCTAssert(manager.getCalculInstance.isDecimal == false)
        XCTAssert(manager.getCalculInstance.isEnded == false)
        XCTAssert(manager.getCalculInstance.isTenOrSo == false)
        XCTAssertNil(manager.getCalculInstance.currentNumber)
        XCTAssert(manager.getCalculInstance.returnTotal == 0)
        XCTAssert(manager.getCalculInstance.getPreviousNumber == 0)
        XCTAssert(manager.getCalculInstance.getOperator == "")
        
        XCTAssert(manager.getCodeErreur == nil)
    }
    
    func testCanDivideWithZero() {
        let nb1 = 1
        let nb2 = 0
        
        manager.keypadBtn(senderTag: nb1)
        manager.divideBtn()
        manager.keypadBtn(senderTag: nb2)
        manager.plusBtn()
        
        XCTAssertEqual(manager.getCodeErreur, 3)
        XCTAssert(manager.getCodeErreur == 3)
    }
    
}
