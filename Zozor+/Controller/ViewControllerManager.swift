//
//  ViewControllerManager.swift
//  CountOnMe
//
//  Created by Nicolas on 11/07/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//
// ------------------------------------------------------------
// This file is the vc manager, it's the interface between VC and logic (calculManager).
// Get input, work and set output.
// ------------------------------------------------------------

import UIKit

class ViewControllerManager {
    // ------------------------------------------------------------
    // MARK: Property
    // ------------------------------------------------------------
    private let calcul = CalculManager()
    private var _displayNumber = ""
    private var _textView = ""
    private var _codeErreur: Int?
    // ------------------------------------------------------------
    // MARK: Getter
    // ------------------------------------------------------------
    var textView: String {
        return _textView
    }
    
    var getCalculInstance: CalculManager {
        return calcul
    }
    
    var getCodeErreur: Int? {
        guard _codeErreur != nil else {
            return nil
        }
        return _codeErreur!
    }
    // ------------------------------------------------------------
    // MARK: Input
    // ------------------------------------------------------------
    func keypadBtn(with senderTag: Int) {
        // action when a btn number is touch in keypad
        keypadAction(with: senderTag)
    }
    
    func additionBtn() {
        // action when addition btn is presed
        actionsForOperators(senderOperator: "+")
    }
    
    func minusBtn() {
        // action when minus btn is presed
        actionsForOperators(senderOperator: "-")
    }
    
    func multiplyBtn() {
        // action when multyply btn is presed
        actionsForOperators(senderOperator: "*")
    }
    
    func divideBtn() {
        // action when divide btn is presed
        actionsForOperators(senderOperator: "/")
    }
    
    func addCommaBtn() {
        // actions when add comma for decimal
        enabledDecimal()
    }
    
    func equalBtn() {
        // action when equal btn is presed
        guard isCorrect, !calcul.isEnded else { return  }
        calculate()
    }
    
    func acBtn() {
        // action when reset btn is presed
        resetCalcul()
    }
    // ------------------------------------------------------------
    // MARK: private computed properties and methode.
    // ------------------------------------------------------------
    private func keypadAction(with senderTag: Int) {
        // methode to add new number from keypad and update
        _codeErreur = nil
        if needToClear {
            calcul.clear()
        }
        calcul.isEnded = false
        _displayNumber = _displayNumber + String(senderTag)
        calcul.addCurrentNumber(with: senderTag)
        updateDisplay() //
    }

    private func resetCalcul() {
        // methode to reset calcul
        _codeErreur = nil
        calcul.clear()
        _displayNumber = "0"
        updateDisplay()
        _displayNumber.removeAll()
        calcul.isEnded = false
    }
    
    private func calculate() {
        // methode to start calcul the resultat of any operation
        calcul.isEnded = true
        calcul.isDecimal = false
        calcul.isTenOrSo = false
        calculAndDisplayTotal()
        _displayNumber.removeAll()
        calcul.addOperator(withThis: "")
        calcul.restDecimalLong()
    }
    
    private func enabledDecimal() {
        // methode to add decimals numbers
        calcul.isDecimal = true
        _displayNumber = _displayNumber + "."
        updateDisplay()
        calcul.isTenOrSo = false
    }
    
    private func actionsForOperators(senderOperator signe: String) {
        // methode for calcul intermediate steps
        calcul.noNumber = false
        guard isCorrect, !calcul.isEnded else {
            calcul.isDecimal = false
            if calcul.isEnded {
                // do take last result for new operation
                calcul.addOperator(withThis: signe)
                _displayNumber = String(calcul.returnTotal) + signe
                updateDisplay() //
            }
            return
        }
        // do start new calcul
        if calcul.isDecimal {
            calcul.calculDecimal()
        }
        if calcul.isFirstStep {
            calcul.addOperator(withThis: signe)
            displayNewOperator(with: signe)
            calcul.isFirstStep = false
        }
        else {
            calcul.updateResult()
            calcul.addOperator(withThis: signe)
            displayNewOperator(with: signe)
            calcul.isDecimal = false
        }
    }
    
    private func displayNewOperator(with signe: String) {
        // methode for update  screen
        _displayNumber = _displayNumber + signe
        updateDisplay()
    }
    
    private func updateDisplay() {
        // methode to update _textView property with displed number
        _textView = _displayNumber
    }
    
    private func calculAndDisplayTotal() {
        // display total on screen
        guard isCorrect else { return }
        calcul.updateResult()
        let total = calcul.returnTotal
        _textView = _textView + " = \(total)"
    }
    
    private var isCorrect: Bool {
        // methode to check if calcul is correst and set code erreurs for VC display
        var isCorrect: Bool
        if calcul.checkFirstStep { _codeErreur = 1; isCorrect = false }
        else if _displayNumber == "", calcul.isFirstStep { _codeErreur = 2; isCorrect = false }
        else if calcul.checkIfDiviseWithZero { _codeErreur = 3; isCorrect = false }
        else { isCorrect = true }
        return isCorrect
    }
    
    private var needToClear: Bool {
        // refactor check if operator is present at the end of calcul
        var needToClear = false
        if calcul.getOperator == "" && calcul.isEnded {
            needToClear = true
        }
        return needToClear
    }
}
