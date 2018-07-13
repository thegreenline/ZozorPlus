//
//  ViewControllerManager.swift
//  CountOnMe
//
//  Created by Nicolas on 11/07/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewControllerManager {
    
    private let calcul = CalculManager() // instance of class CalculModel
    var _displayNumber: String = ""
    var textView = ""
    private var _codeErreur: Int?

    
    var getCalculInstance: CalculManager {
        return calcul
    }
    
    var getCodeErreur: Int? {
        guard _codeErreur != nil else {
            return nil
        }
        return _codeErreur!
    }
    private var isCorrect: Bool {
        var isCorrect: Bool
        if calcul.checkFirstStep { _codeErreur = 1; isCorrect = false }
         if _displayNumber == "", calcul.isFirstStep { _codeErreur = 2; isCorrect = false }
        else if calcul.checkIfDiviseWithZero { _codeErreur = 3; isCorrect = false }
         else { isCorrect = true }
        return isCorrect
    }
    
    var needToClear: Bool {
        // refactor check if operator is present at the end of calcul
        var needToClear = false
        if calcul.getOperator == "" && calcul.isEnded {
            needToClear = true
        }
        return needToClear
    }
    
    func keypadBtn(senderTag: Int) {
        _codeErreur = nil
        if needToClear {
            calcul.clear()
        }
        calcul.isEnded = false
        _displayNumber = _displayNumber + String(senderTag)
        calcul.addCurrentNumber(senderTag)
        updateDisplay() //
    }
    
    func plusBtn() {
        // action when plus btn is presed
        guard isCorrect, !calcul.isEnded else {
            calcul.isDecimal = false
            if calcul.isEnded {
                calcul.addOperator(signe: "+")
                _displayNumber = String(calcul.returnTotal) + "+"
                updateDisplay() //
            }
            return
        }
        // do start new calcul
        if calcul.isFirstStep {
            calcul.addOperator(signe: "+")
            _displayNumber = _displayNumber + "+"
            updateDisplay() //
            calcul.isFirstStep = false
        } else {
            calcul.updateResult()
            calcul.addOperator(signe: "+")
            _displayNumber = _displayNumber + "+"
            updateDisplay() //
            calcul.isDecimal = false
        }
    }
    func minusBtn() {
        // action when minus btn is presed
        
        guard isCorrect, !calcul.isEnded else {
            calcul.isDecimal = false
            if calcul.isEnded {
                // do take last result for new operation
                calcul.addOperator(signe: "-")
                _displayNumber = String(calcul.returnTotal) + "-"
                updateDisplay()
            }
            return
        }
        // do start new calcul
        if calcul.isFirstStep {
            calcul.addOperator(signe: "-")
            _displayNumber = _displayNumber + "-"
            updateDisplay() //
            calcul.isFirstStep = false
        } else {
            calcul.updateResult()
            calcul.addOperator(signe: "-")
            _displayNumber = _displayNumber + "-"
            updateDisplay() //
            calcul.isDecimal = false ///
        }
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
        
        if calcul.isFirstStep {
            calcul.addOperator(signe: "*")
            _displayNumber = _displayNumber + "*"
            updateDisplay() //
            calcul.isFirstStep = false
        } else {
            calcul.updateResult()
            calcul.addOperator(signe: "*")
            _displayNumber = _displayNumber + "*"
            updateDisplay() //
            calcul.isDecimal = false ///
        }
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
        
        if calcul.isFirstStep {
            calcul.addOperator(signe: "/")
            _displayNumber = _displayNumber + "/"
            updateDisplay() //
            calcul.isFirstStep = false
        } else {
            calcul.updateResult()
            calcul.addOperator(signe: "/")
            _displayNumber = _displayNumber + "/"
            updateDisplay() //
            calcul.isDecimal = false ///
        }
    }
    func addCommaBtn() {
        calcul.isDecimal = true
        _displayNumber = _displayNumber + "."
        updateDisplay()
        calcul.isTenOrSo = false
    }
    func equalBtn() {
        // action when equal btn is presed
        
        guard isCorrect, !calcul.isEnded else { return }
        calcul.isEnded = true
        calcul.isDecimal = false
        calcul.isTenOrSo = false
        calculAndDisplayTotal() ////////////////////-0-//
        _displayNumber.removeAll()
        calcul.addOperator(signe: "")
        calcul.restDecimalLong()
    }
    
    func acBtn() {
        // action when reset btn is presed
        _codeErreur = nil
        calcul.clear()
        _displayNumber = "0"
        updateDisplay()
        _displayNumber.removeAll()
        calcul.isEnded = false
    }
    
    private func calculAndDisplayTotal() {
        // display total on screen
        
        guard isCorrect else { return }
        calcul.updateResult()
        let total = calcul.returnTotal /////////////////-0-
        textView = textView + " = \(total)"
        print("resultat display : " + textView)
    }
    
    private func updateDisplay() {
        var text: String
        text = "\(_displayNumber)"
        textView = text
        print(textView)
    }
}
