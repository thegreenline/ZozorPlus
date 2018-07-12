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
    private var _codeErreur = 0
    
    var getCalculInstance: CalculManager {
        return calcul
    }
    
    var getCodeErreur: Int {
        return _codeErreur
    }
    private var isCorrect: Bool {
        // FIXME: need to reel check here, le lier au VC !?
        
        if calcul.checkFirstStep { _codeErreur = 1; return false }
         if _displayNumber == "", calcul.isFirstStep { _codeErreur = 2; return false }
        else if calcul.checkIfDiviseWithZero { _codeErreur = 3; return false }
        print("Code erreur : \(_codeErreur)")
        _codeErreur = 0
        return true
    }
    
    var needToClear: Bool {
        // refactor check if operator is present at the end of calcul
        
        if calcul.getOperator == "" && calcul.isEnded {
            return true
        } else {
            return false
        }
    }
    
    func keypadBtn(senderTag: Int) {
        _codeErreur = 0
        if needToClear {
            calcul.clear()
        }
        calcul.isEnded = false
        _displayNumber = _displayNumber + String(senderTag)
        calcul.addCurrentNumber(senderTag)
        updateDisplay() //
        print("resultat au keypad \(calcul.returnTotal)")
    }
    
    func plusBtn() {
        // action when plus btn is presed
        // FIXME: comment lier le isCorrect ??
        guard isCorrect, !calcul.isEnded else {
            // FIXME: voir ou doit etre remis a faux la valeur isDecimal, je pense aue ici c'est bien
            calcul.isDecimal = false
            if calcul.isEnded {
                // do take last result for new operation
                calcul.addOperator(signe: "+")
                _displayNumber = String(calcul.returnTotal) + "+"
                updateDisplay() //
//                calcul.isDecimal = false
            }
            return
        }
//      ////////   do start new calcul
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
            calcul.isDecimal = false //////////////////// resoluton des decimals 1 chiffre
        }
        print("resultat au PLUS \(calcul.returnTotal)")
//        calcul.isDecimal = false
    }
    func minusBtn() {
        // action when minus btn is presed
        
        guard isCorrect, !calcul.isEnded else {
            // FIXME: reflexion idem aue pour le + concenrnant le isDecimal
            calcul.isDecimal = false
            if calcul.isEnded {
                // do take last result for new operation
                calcul.addOperator(signe: "-")
                _displayNumber = String(calcul.returnTotal) + "-"
                updateDisplay()
            }
            return
        }
        /////////// do start new calcul
        
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
        
        print("resultat au MOINS \(calcul.returnTotal)")
        
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
    }
    func equalBtn() {
        // action when equal btn is presed
        
        guard !calcul.isEnded else { return }
        calcul.isEnded = true
        calcul.isDecimal = false
        calculAndDisplayTotal() ////////////////////-0-//
        _displayNumber.removeAll()
        //            calcul.isEnded = true
        calcul.addOperator(signe: "")
        print("Get total = \(calcul.returnTotal)")
        // FIXME: remettre a true isFirstStep ????
        //        calcul.isFirstStep = true
        
    }
    
    func acBtn() {
        // action when reset btn is presed
        _codeErreur = 0
        calcul.clear()
        _displayNumber = "0"
        updateDisplay()
        _displayNumber.removeAll()
        calcul.isEnded = false
    }
    
    private func calculAndDisplayTotal() {
        // display total on screen
        
        guard isCorrect else { return }
        //        let total = calcul.getTotal
        calcul.updateResult()
        let total = calcul.returnTotal /////////////////-0-
        textView = textView + " = \(total)"
        print("resultat display : " + textView)
    }
    
    private func updateDisplay() {
//        print("Need to create func or limk for update display !!!")
        var text: String
        text = "\(_displayNumber)"
        textView = text
        print(textView)
    }
}
