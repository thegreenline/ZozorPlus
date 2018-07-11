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
    
    func testLeTest() {
        let nb1 = 1
        let nb2 = 2
        let nb3 = 4
        var result = 0.0
        
        manager.keypadBtn(senderTag: nb1)
        manager.plusBtn()
        manager.keypadBtn(senderTag: nb2)
        manager.minusBtn()
        manager.keypadBtn(senderTag: nb3)
        manager.equalBtn()
        
        let total = manager.getCalculInstance.returnTotal
        result = Double(nb1) + Double(nb2) - Double(nb3)
        
        
        XCTAssertEqual(result, total)
        XCTAssert(manager.getCodeErreur == 0)
    }
    
}
