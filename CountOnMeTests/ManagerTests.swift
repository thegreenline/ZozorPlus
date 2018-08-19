//
//  ManagerTests.swift
//  CountOnMeTests
//
//  Created by Nicolas on 11/07/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//
// When:
// Given:
// Then:

import XCTest
@testable import CountOnMe

class ManagerTests: XCTestCase {
    var manager = ViewControllerManager()
    var result: Double = 0
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

    override func setUp() {
        super.setUp()
        manager = ViewControllerManager()
        result = 0
    }
    
    func test_WhenTryToCalculAnAddition() {
        // When: Try to calcul a addition
        // Given: get result
        // Then: is same as computed local result and codeErreur is nil
        manager.keypadBtn(with: nb1)
        manager.additionBtn()
        manager.keypadBtn(with: nb2)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) + Double(nb2)
        
        XCTAssert(result == total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func test_WhenTryToCalculAnMinus() {
        // When: Try to calcul a soustraction
        // Given: get result
        // Then: is same as computed local result and codeErreur is nil
        manager.keypadBtn(with: nb1)
        manager.minusBtn()
        manager.keypadBtn(with: nb2)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) - Double(nb2)
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func test_WhenTryToCalculAnMultiply() {
        // When: Try to calcul a multiplication
        // Given: get result
        // Then: is same as computed local result and codeErreur is nil
        manager.keypadBtn(with: nb1)
        manager.multiplyBtn()
        manager.keypadBtn(with: nb2)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) * Double(nb2)
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func test_WhenTryToCalculAnDivide() {
        // When: Try to calcul a division
        // Given: get result
        // Then: is same as computed local result and codeErreur is nil
        manager.keypadBtn(with: nb1)
        manager.divideBtn()
        manager.keypadBtn(with: nb2)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) / Double(nb2)
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func test_WhentryToCalculASequence() {
        // When: try to calcul a sequence
        // Given: get result
        // Then: is the sane as computed local result and codeErreur is nil
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
    func test_WhenTryToCalculSequenceWithAllOperatorsAndChainCalc() {
        // When: try to calcul sequence with all operators and chained calc
        // Given: get result
        // Then: is the sane as computed local result and codeErreur is nil
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
    func test_WhenTryToCalculSequenceWithAllOperatorsAndChainCalcWhithBigNumber() {
        // When: try to calcul sequence with all operators and chained calc with only big numbers
        // Given: get result
        // Then: is the sane as computed local result and codeErreur is nil
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
        result = Double(nb1 * 10 + nb4) + Double(nb2 * 10 + nb2)
        result = result - Double(nb3 * 10 + nb3)
        result = result * Double(nb5 * 10 + nb5)
        result = result / Double(nb6 * 10 + nb6)
        
        result = result + Double(nb1 * 10 + nb2)
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func test_WhenTryToSequenceAllOperatorsInClacAndStartNewCalc() {
        // When: try to sequence a calc with all operators and start a new calc without AC btn
        // Given: get the seconde result
        // Then: is the same as computed local result and codeErreur is nil
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
    func test_WhenComputeSimpleAdditionWithOneDecimal() {
        // When: Compute a simple addtion with one decimal
        // Given: get the seconde result
        // Then: is the same as computed local result and codeErreur is nil
        manager.keypadBtn(with: nb1)
        manager.additionBtn()
        manager.keypadBtn(with: nb0)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb0) + Double(nb3) / 10
        result = Double(nb1) + decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func test_WhenComputeSimpleSoustractionWithOneDecimal() {
        // When: compute a simple soustraction with one decimal
        // Given: get the seconde result
        // Then: is the same as computed local result and codeErreur is nil
        manager.keypadBtn(with: nb1)
        manager.minusBtn()
        manager.keypadBtn(with: nb0)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb0) + Double(nb3) / 10
        result = Double(nb1) - decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func test_WhenComputeSimpleDivisionWithOneDecimal() {
        // When: compute a simple division with one decimal
        // Given: get the seconde result
        // Then: is the same as computed local result and codeErreur is nil
        manager.keypadBtn(with: nb1)
        manager.divideBtn()
        manager.keypadBtn(with: nb0)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb0) + Double(nb3) / 10
        result = Double(nb1) / decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func test_WhenComputeSimpleMultiplicationWithOneDecimal() {
        // When: compute a simple multiplication with one decimal
        // Given: get the seconde result
        // Then: is the same as computed local result and codeErreur is nil
        manager.keypadBtn(with: nb1)
        manager.multiplyBtn()
        manager.keypadBtn(with: nb0)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb0) + Double(nb3) / 10
        result = Double(nb1) * decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func test_WhenComputeSimpleDivisionWithManyDecimal() {
        // When: compute a simple division with many decimal
        // Given: get the seconde result
        // Then: is the same as computed local result and codeErreur is nil
        manager.keypadBtn(with: nb1)
        manager.divideBtn()
        manager.keypadBtn(with: nb0)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb3)
        manager.keypadBtn(with: nb4)
        manager.keypadBtn(with: nb3)
        manager.keypadBtn(with: nb4)
        manager.keypadBtn(with: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb0) + Double(nb3) / 10 + Double(nb4) / 100 + Double(nb3) / 1000 + Double(nb4) / 10000 + Double(nb3) / 100000
        result = Double(nb1) / decimal
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func test_WhenComputeComplexCalculWithOneDecimal() {
        // When: compute a complex calcul with one decimal
        // Given: get the seconde result
        // Then: is the same as computed local result and codeErreur is nil
        manager.keypadBtn(with: nb1)
        manager.additionBtn()
        manager.keypadBtn(with: nb0)
        manager.addCommaBtn()
        manager.keypadBtn(with: nb3)
        manager.keypadBtn(with: nb3)
        manager.additionBtn()
        manager.keypadBtn(with: nb4)
        manager.minusBtn()
        manager.keypadBtn(with: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        let decimal: Double = Double(nb0) + Double(nb3) / 10 + Double(nb3) / 100
        result = Double(nb1) + decimal + Double(nb4) - Double(nb3)
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func test_WhenComputeBigNumberWithNotZeroDecimalInAddition() {
        // When: addition with big numbers with decimals not start with zero
        // Given: get the seconde result
        // Then: is the same as computed local result and codeErreur is nil
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
    func test_WhenComputeBigNumberWithNotZeroDecimalInSoustraction() {
        // When: soustraction with big numbers with decimals not start with zero
        // Given: get the seconde result
        // Then: is the same as computed local result and codeErreur is nil
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
    func test_WhenComputeBigNumberWithNotZeroDecimalInMultiplication() {
        // When: multiplication with big numbers with decimals not start with zero
        // Given: get the seconde result
        // Then: is the same as computed local result and codeErreur is nil
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
    func test_WhenComputeBigNumberWithNotZeroDecimalInDivision() {
        // When: division with big numbers with decimals not start with zero
        // Given: get the seconde result
        // Then: is the same as computed local result and codeErreur is nil
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
    func test_WhenTouchAc() {
        // When: touche AC btn
        // Given: get totla
        // Then: is egal to 0 and all properties are in start state
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
    func test_WhenCheckFirstStep() {
        // When: check first step
        // Given: touch equal btn
        // Then: codeErreur is 1
        manager.equalBtn()
        
        XCTAssert(manager.getCodeErreur == 1)
    }
    func test_WhenWrongExpression() {
        // When: wrong expression
        // Given: touch operator btn
        // Then: codeErreur is 2
        manager.multiplyBtn()
        
        XCTAssert(manager.getCodeErreur == 2)
    }
    func test_WhenCanDivideWithZero() {
        // When: try to divide with 0
        // Given: whant get result
        // Then: codeErreur is 3
        manager.keypadBtn(with: nb1)
        manager.divideBtn()
        manager.keypadBtn(with: nb0)
        manager.equalBtn()
        
        XCTAssert(manager.getCodeErreur == 3)
    }
    func test_WhenBigNumberWithNotZeroDecimalAndDixaineMultiply() {
        // When: compute big number with not zero decimal
        // Given: get the seconde result
        // Then: is the same as computed local result and codeErreur is nil
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
    func test_WhenBigNumberWithDecimalInFirstStepCalculMultiply() {
        // When: compute big number with decimal in first step (multiplication)
        // Given: get the seconde result
        // Then: is the same as computed local result and codeErreur is nil
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
    func test_whenBigNumberWithDecimalInFirstStepCalculAddition() {
        // When: // When: compute big number with decimal in first step (addition)
        // Given: get the seconde result
        // Then: is the same as computed local result and codeErreur is nil
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
    func test_WhenBigNumberWithDecimalInFirstStepCalculSoustract() {
        // When: // When: compute big number with decimal in first step (soustraction)
        // Given: get the seconde result
        // Then: is the same as computed local result and codeErreur is nil
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
    func test_WhenBigNumberWithDecimalInFirstStepCalculDivide() {
        // When: // When: compute big number with decimal in first step (division)
        // Given: get the seconde result
        // Then: is the same as computed local result and codeErreur is nil
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
    func test_WHENBigNumberWithMultiDecimalInFirstStepCalcul() {
        // When: // When: compute big number with many decimal in first step (addition)
        // Given: get the seconde result
        // Then: is the same as computed local result and codeErreur is nil
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
        let decimal1 = Double(nb4) / 10 + Double(nb5) / 100
        let decimal2 = Double(nb4) / 10 + Double(nb5) / 100
        result = Double(nb1 * 10 + nb7) + decimal1
        result = result + Double(nb3 * 10 + nb4) + decimal2
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
    func testBigNumberWithMultiDecimalInFirstStepCalculAndSequenceCalc() {
        // When: // When: compute big number with two decimal in first step (all operators)
        // Given: get the seconde result
        // Then: is the same as computed local result and codeErreur is nil
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
        result = result / calcFiftStep //
        
        XCTAssertEqual(result, total)
        XCTAssertNil(manager.getCodeErreur)
    }
}
