//
//  ViewControllerManager.swift
//  CountOnMe
//
//  Created by Nicolas on 11/07/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewControllerManager {
    
    var isTapNumber = false
    var isTapPlus = false
    var isTapMinus = false
    var isTapMultiply = false
    var isTapDivide = false
    var isTapAddComma = false
    var isTapEqual = false
    var isTapAC = false
    
    private var isCorrect: Bool {
        print("isCorrect")
        return true
    }
    
    var senderTag: Int?
    private let calcul = CalculManager() // instance of class CalculModel
    var _displayNumber: String = ""
    var textView = ""
    private func displayTotal() {
        // display total on screen
        
        guard isCorrect else { return }
        let total = calcul.getTotal
        print(textView + " = \(total)")
    }
    private func updateDisplay() {
        print("Need to create func or limk for update display !!!")
        var text: String
        text = "\(_displayNumber)"
        textView = text
        print(textView)
    }
    
    var needToClear: Bool {
        // refactor check if operator is present at the end of calcul
        
        if calcul.getOperator == "" && calcul.isEnded {
            return true
        } else {
            return false
        }
    }
    
    func keypadBtn() {
        if needToClear {
            calcul.clear()
        }
        calcul.isEnded = false
        _displayNumber = _displayNumber + String(senderTag!)
        calcul.addCurrentNumber(senderTag!)
        updateDisplay() //
        senderTag = nil
    }
    
    func plusBtn() {
        // action when plus btn is presed
        
        guard isCorrect, !calcul.isEnded else { // comment lier is correct ???
            if calcul.isEnded {
                // do take last result for new operation
                calcul.addOperator(signe: "+")
                _displayNumber = String(calcul.returnTotal) + "+"
                updateDisplay() //
            }
            return
        }
        // do start new calcul
        
        calcul.addOperator(signe: "+")
        _displayNumber = _displayNumber + "+"
        calcul.updateResult()
        updateDisplay() //
    }
    func minusBtn() {
        // action when minus btn is presed
        
        guard isCorrect, !calcul.isEnded else {
            if calcul.isEnded {
                // do take last result for new operation
                calcul.addOperator(signe: "-")
                _displayNumber = String(calcul.returnTotal) + "-"
                updateDisplay()
            }
            return
        }
        // do start new calcul
        
        calcul.addOperator(signe: "-")
        _displayNumber = _displayNumber + "-"
        calcul.updateResult()
        updateDisplay()
    }
    func multiplyBtn() {
        // action when multyply btn is presed
        
        guard isCorrect, !calcul.isEnded else {
            if calcul.isEnded {
                // do take last result for new operation
                calcul.addOperator(signe: "*")
                _displayNumber = String(calcul.returnTotal) + "*"
                updateDisplay()
            }
            return
        }
        // do start new calcul
        
        calcul.addOperator(signe: "*")
        _displayNumber = _displayNumber + "x"
        calcul.updateResult()
        updateDisplay()
    }
    func divideBtn() {
        // action when divide btn is presed
        
        guard isCorrect, !calcul.isEnded else {
            if calcul.isEnded {
                // do take last result for new operation
                calcul.addOperator(signe: "/")
                _displayNumber = String(calcul.returnTotal) + "/"
                updateDisplay()
            }
            return
        }
        // do start new calcul
        
        calcul.addOperator(signe: "/")
        _displayNumber = _displayNumber + "/"
        calcul.updateResult()
        updateDisplay()
    }
    func addCommaBtn() {
        calcul.isDecimal = true
        _displayNumber = _displayNumber + "."
        updateDisplay()
    }
    func equalBtn() {
        // action when equal btn is presed
        
        guard !calcul.isEnded else { return }
        calcul.isEnded = true
        displayTotal() ////////////////////-0-//
        _displayNumber.removeAll()
        //            calcul.isEnded = true
        calcul.addOperator(signe: "")
    }
    func acBtn() {
        // action when reset btn is presed
        
        calcul.clear()
        _displayNumber = "0"
        updateDisplay()
        _displayNumber.removeAll()
        calcul.isEnded = false
    }
}
