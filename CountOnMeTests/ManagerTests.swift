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
        XCTAssert(manager.getCodeErreur == 0)
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
        XCTAssert(manager.getCodeErreur == 0)
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
        XCTAssert(manager.getCodeErreur == 0)
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
        XCTAssert(manager.getCodeErreur == 0)
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
        XCTAssert(manager.getCodeErreur == 0)
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
        
        let total = manager.getCalculInstance.returnTotal
        result = (Double(16) + Double(nb2) - Double(nb3)) * Double(nb5) / Double(nb6)
        result = result + Double(12)
        
        XCTAssertEqual(result, total)
        XCTAssert(manager.getCodeErreur == 0)
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
        XCTAssert(manager.getCodeErreur == 0)
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
        XCTAssert(manager.getCodeErreur == 0)
    }
    
    
}
