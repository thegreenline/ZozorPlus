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
    var result: Double = 0
    let nb1 = 1
    let nb2 = 2
    let nb3 = 4
    let nb4 = 6
    let nb5 = 3
    let nb6 = 2
    let nb7 = 0
    
    override func setUp() {
        super.setUp()
        manager = ViewControllerManager()
        result = 0
    }
    
    func testAddition() {
        manager.keypadBtn(senderTag: nb1)
        manager.plusBtn()
        manager.keypadBtn(senderTag: nb2)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) + Double(nb2)
        
        XCTAssert(result == total)
        XCTAssertNil(manager.getCodeErreur)
    }
    
    func testMinus() {
        manager.keypadBtn(senderTag: nb1)
        manager.minusBtn()
        manager.keypadBtn(senderTag: nb2)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) - Double(nb2)
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    
    func testMultiply() {
        manager.keypadBtn(senderTag: nb1)
        manager.multiplyBtn()
        manager.keypadBtn(senderTag: nb2)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) * Double(nb2)
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    
    func testDivide() {
        manager.keypadBtn(senderTag: nb1)
        manager.divideBtn()
        manager.keypadBtn(senderTag: nb2)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) / Double(nb2)
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    
    func testCalculSequence() {
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
        XCTAssertNil(manager.getCodeErreur)
    }
    
    func testAllOperatorsSequenceAndChainCalc() {
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
        result = (Double(nb1 * 10 + nb4) + Double(nb2) - Double(nb3)) * Double(nb5) / Double(nb6)
        result = result + Double(12)
        result = result - Double(21)
        result = result * Double(12)
        result = result / Double(nb5)
        
        result = Double(12) * Double(12)
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    
    func testAllOperatorsSequenceAndChainCalcWhithBigNumber() {
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
        result = (Double(nb1 * 10 + nb4) + Double(nb2 * 10 + nb2) - Double(nb3 * 10 + nb3)) * Double(nb5 * 10 + nb5) / Double(nb2 * 10 + nb2)
        result = result + Double(12)
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }

    func testAllOperatorsSequenceAndStartNewCalc() {
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
        XCTAssertNil(manager.getCodeErreur)
    }
    
    func testOneDecimalSImpleCalculPlus() {
        manager.keypadBtn(senderTag: nb1)
        manager.plusBtn()
        manager.keypadBtn(senderTag: nb7)
        manager.addCommaBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb7) + Double(nb3) / 10
        result = Double(nb1) + decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    
    func testOneDecimalSImpleCalculMinus() {
        manager.keypadBtn(senderTag: nb1)
        manager.minusBtn()
        manager.keypadBtn(senderTag: nb7)
        manager.addCommaBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb7) + Double(nb3) / 10
        result = Double(nb1) - decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    
    func testOneDecimalSImpleCalculDivide() {
        manager.keypadBtn(senderTag: nb1)
        manager.divideBtn()
        manager.keypadBtn(senderTag: nb7)
        manager.addCommaBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb7) + Double(nb3) / 10
        result = Double(nb1) / decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    
    func testOneDecimalComplexCalculDivide() {
        manager.keypadBtn(senderTag: nb1)
        manager.divideBtn()
        manager.keypadBtn(senderTag: nb7)
        manager.addCommaBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.keypadBtn(senderTag: nb4)
        manager.keypadBtn(senderTag: nb3)
        manager.keypadBtn(senderTag: nb4)
        manager.keypadBtn(senderTag: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb7) + Double(nb3) / 10 + Double(nb4) / 100 + Double(nb3) / 1000 + Double(nb4) / 10000 + Double(nb3) / 100000
        result = Double(nb1) / decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    
    func testOneDecimalSImpleCalculMultiply() {
        manager.keypadBtn(senderTag: nb1)
        manager.multiplyBtn()
        manager.keypadBtn(senderTag: nb7)
        manager.addCommaBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb7) + Double(nb3) / 10
        result = Double(nb1) * decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    
    func testOneDecimalMediumCalculOnlyPlus() {
        manager.keypadBtn(senderTag: nb1)
        manager.plusBtn()
        manager.keypadBtn(senderTag: nb7)
        manager.addCommaBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.keypadBtn(senderTag: nb3)
        manager.plusBtn()
        manager.keypadBtn(senderTag: nb4)
        manager.minusBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb7) + Double(nb3) / 10 + Double(nb3) / 100
        result = Double(nb1) + decimal + Double(nb4) - Double(nb3)
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    
    func testTwoDecimalSImpleCalcul() {
        manager.keypadBtn(senderTag: nb1)
        manager.plusBtn()
        manager.keypadBtn(senderTag: nb7)
        manager.addCommaBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.keypadBtn(senderTag: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb7) + Double(nb3) / 10 + Double(nb3) / 100
        result = Double(nb1) + decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)    }
    
    
    func testBigNumberWithNotZeroDecimal() {
        manager.keypadBtn(senderTag: nb1)
        manager.keypadBtn(senderTag: nb7)
        manager.plusBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.addCommaBtn()
        manager.keypadBtn(senderTag: nb4)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb3) + Double(nb4) / 10
        result = Double(nb1 * 10 + nb7) + decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    
    func testBigNumberWithNotZeroDecimalMinus() {
        manager.keypadBtn(senderTag: nb1)
        manager.keypadBtn(senderTag: nb7)
        manager.minusBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.addCommaBtn()
        manager.keypadBtn(senderTag: nb4)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb3) + Double(nb4) / 10
        result = Double(nb1 * 10 + nb7) - decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    
    func testBigNumberWithNotZeroDecimalMultiply() {
        manager.keypadBtn(senderTag: nb1)
        manager.keypadBtn(senderTag: nb7)
        manager.multiplyBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.addCommaBtn()
        manager.keypadBtn(senderTag: nb4)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb3) + Double(nb4) / 10
        result = Double(nb1 * 10 + nb7) * decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    
    func testBigNumberWithNotZeroDecimalDivide() {
        manager.keypadBtn(senderTag: nb1)
        manager.keypadBtn(senderTag: nb7)
        manager.divideBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.addCommaBtn()
        manager.keypadBtn(senderTag: nb4)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb3) + Double(nb4) / 10
        result = Double(nb1 * 10 + nb7) / decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    
    func testAcFunction() {
        manager.keypadBtn(senderTag: nb1)
        manager.plusBtn()
        manager.keypadBtn(senderTag: nb2)
        manager.addCommaBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.keypadBtn(senderTag: nb3)
        manager.equalBtn()

        manager.acBtn()
        
        let total = manager.getCalculInstance.returnTotal
        XCTAssertEqual(total, 0)
        
        XCTAssertTrue(manager.getCalculInstance.isFirstStep)
        XCTAssertFalse(manager.getCalculInstance.isDecimal)
        XCTAssertFalse(manager.getCalculInstance.isEnded)
        XCTAssertFalse(manager.getCalculInstance.isTenOrSo)
        XCTAssertNil(manager.getCalculInstance.currentNumber)
        XCTAssert(manager.getCalculInstance.returnTotal == 0)
        XCTAssert(manager.getCalculInstance.getPreviousNumber == 0)
        XCTAssert(manager.getCalculInstance.getOperator == "")
        
        XCTAssertNil(manager.getCodeErreur)
    }
    
    func testCanDivideWithZero() {
        manager.keypadBtn(senderTag: nb1)
        manager.divideBtn()
        manager.keypadBtn(senderTag: nb7)
        manager.plusBtn()
        
        XCTAssertEqual(manager.getCodeErreur, 3)
        XCTAssert(manager.getCodeErreur == 3)
    }
    
}
