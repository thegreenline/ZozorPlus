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
    let nb8 = 5

    override func setUp() {
        super.setUp()
        manager = ViewControllerManager()
        result = 0
    }
    
    func testAddition() {
        manager.keypadBtn(with: nb1)
        manager.additionBtn()
        manager.keypadBtn(with: nb2)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) + Double(nb2)
        
        XCTAssert(result == total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testMinus() {
        manager.keypadBtn(with: nb1)
        manager.minusBtn()
        manager.keypadBtn(with: nb2)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) - Double(nb2)
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testMultiply() {
        manager.keypadBtn(with: nb1)
        manager.multiplyBtn()
        manager.keypadBtn(with: nb2)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) * Double(nb2)
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testDivide() {
        manager.keypadBtn(with: nb1)
        manager.divideBtn()
        manager.keypadBtn(with: nb2)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) / Double(nb2)
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testCalculSequence() {
        manager.keypadBtn(with: nb1)
        manager.keypadBtn(with: nb4)
        manager.additionBtn()
        manager.keypadBtn(with: nb2)
        manager.minusBtn()
        manager.keypadBtn(with: nb3)

        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1 * 10 + nb4) + Double(nb2) - Double(nb3)
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testAllOperatorsSequenceAndChainCalc() {
        manager.keypadBtn(with: nb1)
        manager.keypadBtn(with: nb4)
        manager.additionBtn()
        manager.keypadBtn(with: nb2)
        manager.minusBtn()
        manager.keypadBtn(with: nb3)
        manager.multiplyBtn()
        manager.keypadBtn(with: nb5)
        manager.divideBtn()
        manager.keypadBtn(with: nb6)
        manager.equalBtn()
        
        manager.additionBtn()
        manager.keypadBtn(with: nb1)
        manager.keypadBtn(with: nb2)
        manager.equalBtn()
        
        manager.minusBtn()
        manager.keypadBtn(with: nb2)
        manager.keypadBtn(with: nb1)
        manager.equalBtn()
        
        manager.multiplyBtn()
        manager.keypadBtn(with: nb1)
        manager.keypadBtn(with: nb2)
        manager.equalBtn()
        
        manager.divideBtn()
        manager.keypadBtn(with: nb5)
        manager.equalBtn()
        
        manager.keypadBtn(with: nb1)
        manager.keypadBtn(with: nb2)
        manager.multiplyBtn()
        manager.keypadBtn(with: nb1)
        manager.keypadBtn(with: nb2)
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
        manager.keypadBtn(with: nb1)
        manager.keypadBtn(with: nb4)
        manager.additionBtn()
        manager.keypadBtn(with: nb2)
        manager.keypadBtn(with: nb2)
        manager.minusBtn()
        manager.keypadBtn(with: nb3)
        manager.keypadBtn(with: nb3)
        manager.multiplyBtn()
        manager.keypadBtn(with: nb5)
        manager.keypadBtn(with: nb5)
        manager.divideBtn()
        manager.keypadBtn(with: nb6)
        manager.keypadBtn(with: nb6)
        manager.equalBtn()
        
        manager.additionBtn()
        manager.keypadBtn(with: nb1)
        manager.keypadBtn(with: nb2)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = (Double(nb1 * 10 + nb4) + Double(nb2 * 10 + nb2) - Double(nb3 * 10 + nb3)) * Double(nb5 * 10 + nb5) / Double(nb2 * 10 + nb2)
        result = result + Double(12)
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testAllOperatorsSequenceAndStartNewCalc() {
        manager.keypadBtn(with: nb1)
        manager.keypadBtn(with: nb4)
        manager.additionBtn()
        manager.keypadBtn(with: nb2)
        manager.minusBtn()
        manager.keypadBtn(with: nb3)
        manager.multiplyBtn()
        manager.keypadBtn(with: nb5)
        manager.divideBtn()
        manager.keypadBtn(with: nb6)
        manager.equalBtn()
        
        manager.keypadBtn(with: nb1)
        manager.additionBtn()
        manager.keypadBtn(with: nb2)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) + Double(nb2)
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testOneDecimalSImpleCalculPlus() {
        manager.keypadBtn(with: nb1)
        manager.additionBtn()
        manager.keypadBtn(with: nb7)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb7) + Double(nb3) / 10
        result = Double(nb1) + decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testOneDecimalSImpleCalculMinus() {
        manager.keypadBtn(with: nb1)
        manager.minusBtn()
        manager.keypadBtn(with: nb7)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb7) + Double(nb3) / 10
        result = Double(nb1) - decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testOneDecimalSImpleCalculDivide() {
        manager.keypadBtn(with: nb1)
        manager.divideBtn()
        manager.keypadBtn(with: nb7)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb7) + Double(nb3) / 10
        result = Double(nb1) / decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testOneDecimalComplexCalculDivide() {
        manager.keypadBtn(with: nb1)
        manager.divideBtn()
        manager.keypadBtn(with: nb7)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb3)
        manager.keypadBtn(with: nb4)
        manager.keypadBtn(with: nb3)
        manager.keypadBtn(with: nb4)
        manager.keypadBtn(with: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb7) + Double(nb3) / 10 + Double(nb4) / 100 + Double(nb3) / 1000 + Double(nb4) / 10000 + Double(nb3) / 100000
        result = Double(nb1) / decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testOneDecimalSImpleCalculMultiply() {
        manager.keypadBtn(with: nb1)
        manager.multiplyBtn()
        manager.keypadBtn(with: nb7)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb7) + Double(nb3) / 10
        result = Double(nb1) * decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testOneDecimalMediumCalculOnlyPlus() {
        manager.keypadBtn(with: nb1)
        manager.additionBtn()
        manager.keypadBtn(with: nb7)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb3)
        manager.keypadBtn(with: nb3)
        manager.additionBtn()
        manager.keypadBtn(with: nb4)
        manager.minusBtn()
        manager.keypadBtn(with: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb7) + Double(nb3) / 10 + Double(nb3) / 100
        result = Double(nb1) + decimal + Double(nb4) - Double(nb3)
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testTwoDecimalSImpleCalcul() {
        manager.keypadBtn(with: nb1)
        manager.additionBtn()
        manager.keypadBtn(with: nb7)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb3)
        manager.keypadBtn(with: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb7) + Double(nb3) / 10 + Double(nb3) / 100
        result = Double(nb1) + decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testBigNumberWithNotZeroDecimal() {
        manager.keypadBtn(with: nb1)
        manager.keypadBtn(with: nb7)
        manager.additionBtn()
        manager.keypadBtn(with: nb3)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb4)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb3) + Double(nb4) / 10
        result = Double(nb1 * 10 + nb7) + decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testBigNumberWithNotZeroDecimalMinus() {
        manager.keypadBtn(with: nb1)
        manager.keypadBtn(with: nb7)
        manager.minusBtn()
        manager.keypadBtn(with: nb3)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb4)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb3) + Double(nb4) / 10
        result = Double(nb1 * 10 + nb7) - decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testBigNumberWithNotZeroDecimalMultiply() {
        manager.keypadBtn(with: nb1)
        manager.keypadBtn(with: nb7)
        manager.multiplyBtn()
        manager.keypadBtn(with: nb3)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb4)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb3) + Double(nb4) / 10
        result = Double(nb1 * 10 + nb7) * decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testBigNumberWithNotZeroDecimalDivide() {
        manager.keypadBtn(with: nb1)
        manager.keypadBtn(with: nb7)
        manager.divideBtn()
        manager.keypadBtn(with: nb3)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb4)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb3) + Double(nb4) / 10
        result = Double(nb1 * 10 + nb7) / decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testAcFunction() {
        manager.keypadBtn(with: nb1)
        manager.additionBtn()
        manager.keypadBtn(with: nb2)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb3)
        manager.keypadBtn(with: nb3)
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
        manager.keypadBtn(with: nb1)
        manager.divideBtn()
        manager.keypadBtn(with: nb7)
        manager.additionBtn()
        
        XCTAssertEqual(manager.getCodeErreur, 3)
        XCTAssert(manager.getCodeErreur == 3)
    }
    func testBigNumberWithNotZeroDecimalAndDixaineMultiply() {
        manager.keypadBtn(with: nb1)
        manager.keypadBtn(with: nb7)
        manager.multiplyBtn()
        manager.keypadBtn(with: nb3)
        manager.keypadBtn(with: nb4)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb4)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal = Double(nb3 * 10 + nb4) + Double(nb4) / 10
        result = Double(nb1 * 10 + nb7) * decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testBigNumberWithDecimalInFirstStepCalculMultiply() {
        manager.keypadBtn(with: nb1)
        manager.keypadBtn(with: nb7)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb4)

        manager.multiplyBtn()
        manager.keypadBtn(with: nb3)
        manager.keypadBtn(with: nb4)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb4)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimalFisrtStep: Double = Double(nb1 * 10 + nb7) + Double(nb4) / 10
        let decimalSecondStep: Double = Double(nb3 * 10 + nb4) + Double(nb4) / 10
        result = decimalFisrtStep * decimalSecondStep
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testBigNumberWithDecimalInFirstStepCalculAddition() {
        manager.keypadBtn(with: nb1)
        manager.keypadBtn(with: nb7)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb4)
        
        manager.additionBtn()
        manager.keypadBtn(with: nb3)
        manager.keypadBtn(with: nb4)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb4)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimalFisrtStep: Double = Double(nb1 * 10 + nb7) + Double(nb4) / 10
        let decimalSecondStep: Double = Double(nb3 * 10 + nb4) + Double(nb4) / 10
        result = decimalFisrtStep + decimalSecondStep
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testBigNumberWithDecimalInFirstStepCalculSoustract() {
        manager.keypadBtn(with: nb1)
        manager.keypadBtn(with: nb7)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb4)
        
        manager.minusBtn()
        manager.keypadBtn(with: nb3)
        manager.keypadBtn(with: nb4)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb4)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimalFisrtStep: Double = Double(nb1 * 10 + nb7) + Double(nb4) / 10
        let decimalSecondStep: Double = Double(nb3 * 10 + nb4) + Double(nb4) / 10
        result = decimalFisrtStep - decimalSecondStep
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testBigNumberWithDecimalInFirstStepCalculDivide() {
        manager.keypadBtn(with: nb1)
        manager.keypadBtn(with: nb7)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb4)
        
        manager.divideBtn()
        manager.keypadBtn(with: nb3)
        manager.keypadBtn(with: nb4)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb4)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimalFisrtStep: Double = Double(nb1 * 10 + nb7) + Double(nb4) / 10
        let decimalSecondStep: Double = Double(nb3 * 10 + nb4) + Double(nb4) / 10
        result = decimalFisrtStep / decimalSecondStep
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testBigNumberWithMultiDecimalInFirstStepCalcul() {
        manager.keypadBtn(with: nb1)
        manager.keypadBtn(with: nb7)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb4)
        manager.keypadBtn(with: nb5)
        
        manager.additionBtn()
        manager.keypadBtn(with: nb3)
        manager.keypadBtn(with: nb4)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb4)
        manager.keypadBtn(with: nb5)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimalFisrtStep: Double = Double(nb1 * 10 + nb7) + Double(nb4) / 10 + Double(nb5) / 100
        let decimalSecondStep: Double = Double(nb3 * 10 + nb4) + Double(nb4) / 10 + Double(nb5) / 100
        result = decimalFisrtStep + decimalSecondStep
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testBigNumberWithMultiDecimalInFirstStepCalculAndSequenceCalc() {
            let nb0 = 0
            let nb1 = 1
            let nb2 = 2
            let nb3 = 3
            let nb4 = 4
            let nb5 = 5
            let nb6 = 6
            let nb7 = 7
            let nb8 = 8
            let nb9 = 9

        //    25.56 + 12.47 - 22.18
        //    38.03 - 22.18
        //    15.85
        manager.keypadBtn(with: nb2)
        manager.keypadBtn(with: nb5)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb5)
        manager.keypadBtn(with: nb6)
        
        manager.additionBtn()
        manager.keypadBtn(with: nb1)
        manager.keypadBtn(with: nb2)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb4)
        manager.keypadBtn(with: nb7)
        
        manager.minusBtn()
        manager.keypadBtn(with: nb2)
        manager.keypadBtn(with: nb2)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb1)
        manager.keypadBtn(with: nb8)
        
        manager.multiplyBtn()
        manager.keypadBtn(with: nb3)
        manager.keypadBtn(with: nb9)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb0)
        manager.keypadBtn(with: nb9)

        manager.divideBtn()
        manager.keypadBtn(with: nb2)
        manager.keypadBtn(with: nb4)
//        manager.getCalculInstance.isEnded = true
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let calcFisrtStep: Double = Double(nb2 * 10 + nb5) + Double(nb5) / 10 + Double(nb6) / 100
        let calcSecondStep: Double = Double(nb1 * 10 + nb2) + Double(nb4) / 10 + Double(nb7) / 100
        let calcThirdStep: Double = Double(nb2 * 10 + nb2) + Double(nb1) / 10 + Double(nb8) / 100
        
        let calcFourStep: Double = Double(nb3 * 10 + nb9) + Double(nb0) / 10 + Double(nb9) / 100
        let calcFiftStep: Double = Double(nb2 * 10 + nb4)
        result = calcFisrtStep + calcSecondStep - calcThirdStep
        result = result * calcFourStep
        result = result / calcFiftStep
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    
    func testWrongExpression() {
        manager.multiplyBtn()
        XCTAssertEqual(manager.getCodeErreur, 2)
    }
    func testCheckFirstStep() {
        manager.equalBtn()
        XCTAssertEqual(manager.getCodeErreur, 1)
    }
}
