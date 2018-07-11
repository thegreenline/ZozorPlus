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
    let nb1 = 2
    let nb2 = 3
    
    override func setUp() {
        super.setUp()
        test = CalculManager()
    }
    
    func calculSingleNumbers(nb1: Int, nb2: Int, signe: String) -> Int {
        let _nb1 = String(nb1)
        let _nb2 = String(nb2)
        let ope = signe
        
        test.addOperator(signe: "+")
        test.addStringNumbers(number: _nb1)
        test.addOperator(signe: ope)
        test.addStringNumbers(number: _nb2)
        
        var result = 0
        switch signe {
        case "+": result = nb1 + nb2
        case "-": result = nb1 - nb2
        case "/":
            if nb2 != 0 {
                result = nb1 / nb2
            } else {
                result = nb1
            }
        case "*": result = nb1 * nb2
        default: break
        }
        return result
    }
    
    func addComplexNumbers(from fromNum: Int, to toNum: Int) -> Int {
        var current = 0
        for number in fromNum...toNum {
            test.addStringNumbers(number: String(number))
            current = current * 10 + number
        }
        return current
    }
    
    func caclulComplexNumbers(toNb1: Int, toNb2: Int, signe: String) -> Int {
        test.addOperator(signe: "+")
        let _nb1 = addComplexNumbers(from: 1, to: toNb1)
        test.addOperator(signe: signe)
        let _nb2 = addComplexNumbers(from: 1, to: toNb2)
        
        var result = 0
        switch signe {
        case "+": result = _nb1 + _nb2
        case "-": result = _nb1 - _nb2
        case "/": result = _nb1 / _nb2
        case "*": result = _nb1 * _nb2
        default: break
        }
        return result
    }
    
    
    func testLeTest() {
        let testg = calculSingleNumbers(nb1: 2, nb2: 2, signe: "/")
        
        XCTAssertEqual(test.getTotal, testg)
    }
    
    func testClass() {
        XCTAssertNotNil(test)
    }
    
    func testSigne() {
        let plus = "+"
        
        test.addOperator(signe: "+")
        
        XCTAssertEqual(plus, test.getOperator.last)
    }
    
    func testAddNumber() {
        test.addNewNumber(nb1)
        
        XCTAssertEqual(String(nb1), test.getStringNumbers.last)
    }
    
    func testAllOperatoInComplex() {
        let tab = ["+", "-", "/", "*"]

        for signe in tab {
            test.clear()
            let current = caclulComplexNumbers(toNb1: 1, toNb2: 8, signe: signe)
            XCTAssertEqual(test.getTotal, current)
        }
    }
    
    func testAllOperatorsInSimpleOperation() {
        let tab = ["+", "-", "/", "*"]
        
        for signe in tab {
            test.clear()
            let current = calculSingleNumbers(nb1: 2, nb2: 4, signe: signe)
            XCTAssertEqual(test.getTotal, current)
        }
    }
    
    func testCantDevide0() {
        let targetNb = 2
        let current = calculSingleNumbers(nb1: targetNb, nb2: 0, signe: "/")
        
        XCTAssertEqual(test.getTotal, targetNb)
        XCTAssertEqual(current, targetNb)
    }
    
    func testClear() {
        let current = calculSingleNumbers(nb1: 2, nb2: 4, signe: "*")
        
        XCTAssertEqual(test.getTotal, current)
        test.clear()
        
        XCTAssertEqual(test.getStringNumbers, [""])
        XCTAssertEqual(test.getOperator, ["+"])
        XCTAssert(test.getTotal == 0)
    }
    
}
