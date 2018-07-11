//
//  CalculFile.swift
//  CountOnMe
//
//  Created by Nicolas on 26/06/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

class CalculManager {
    // MARK: Proprety
    
    private var _operators: String = "" // array of signes
    private var _addTenOrSo = false
    private var _calculEnded = false
    private var _firstStep = true
    private var _isDecimal = false
    private var _currentNumber: Double?
    private var _previousNumber: Double = 0
    private var _total: Double = 0
    
    // MARK: Getter

    
    var getOperator: String {
        // return current operato
        return _operators
    }
    
    var getTotal: Double {
        // calucul total and return total
        calculateTotal()
        return _total
    }
    var returnTotal: Double {
        // only return total
        return _total
    }
    func updateResult() {
        // only calcul total
        calculateTotal()
    }
    
    var checkFirstStep: Bool {
        // return check if is the first step of calcul
       return didStartNewCalc()
    }
    
    var checkIfDiviseWithZero: Bool {
        // return check if try to divise with 0
        return canDiviseWithZero()
    }
    
    // MARK: Setter
    
    func addOperator(signe: String) {
        // set new operator
        _operators = signe
    }
    
    func addCurrentNumber(_ number: Int) {
        // verify and add a new nember
        
        if isDecimal {
            guard let currentNumber = _currentNumber else { return }
            _previousNumber = currentNumber + Double(number) / 10
             // ajouter une variable decimal number

            _previousNumber = 0
            
            return
        }
        
        if !_addTenOrSo {
            getSetCurrentNumber = Double(number)
            _addTenOrSo = true
        } else {
            guard let currentNumber = _currentNumber else {
                _currentNumber = nil
                return
            }
            getSetCurrentNumber = currentNumber * 10 + Double(number)
        }
    }
    
    // MARK: getter setter

    var isFirstStep: Bool {
        // return bool of the fist step and attibut newvalue
        get {
            return _firstStep
        } set {
            _firstStep = newValue
        }
    }
    
    var isEnded: Bool {
        // return bool of calcul is ended and attibut newvalue
        get {
            return _calculEnded
        } set {
            _calculEnded = newValue
        }
    }
    
    var getSetCurrentNumber: Double? {
        // return current number if is not nil and set new value of currentNumber (for Unit test)
        get {
            guard let currentNumber = _currentNumber else { return nil }
            return currentNumber
        } set {
            _currentNumber = newValue
        }
    }
    
    var isDecimal: Bool {
        get {
            return _isDecimal
        } set {
            _isDecimal = newValue
        }
    }
    
    // MARK: Methode

    func clear() {
        // reset
        _operators = ""
        _previousNumber = 0
        _currentNumber = nil
        _total = 0
        _firstStep = true
        _addTenOrSo = false
        _calculEnded = false
    }
    
    private func canDiviseWithZero() -> Bool {
        // check if try to divise with 0

        var isZero = false
        if _operators == "/" && _currentNumber == 0 {
            isZero = true
        }
        return isZero
    }
    
    private func didStartNewCalc() -> Bool {
        // check if is the first step of calcul

        var returnValue: Bool
        if _operators == "" && isFirstStep && _currentNumber == nil {
            returnValue = true
        } else {
            returnValue = false
        }
        return returnValue
    }
    
    private func calculFirstStep(_ currentNumber: Double) {
        // refactor of redondante part of the calcul method
        _total += currentNumber
        _previousNumber += currentNumber
        _total = 0
        getSetCurrentNumber = 0
        _firstStep = false
    }
    
    private func calculateTotal() {
        // calcul result
        guard let currentNumber = _currentNumber else { return }
        let signe = _operators
        switch signe {
        // FIXME: why 1 + 0.5 = 0.5 ??
        case "+":
            // FIXME: enchainement calcul + voir chaque //
//            if isEnded {// !!
//                _currentNumber = _previousNumber// !!
//                _total = _previousNumber + _currentNumber!// !!!
//            } else {
                if _firstStep {
                    calculFirstStep(currentNumber)
                } else {
                    if isDecimal {
                        print("is decimal")
                        
                        _total = _total + _previousNumber // !!
                        _previousNumber = _total
                        
                        getSetCurrentNumber = 0
                        
                        isDecimal = false
                    } else {
                        print("is not decimal")
                        _total = _previousNumber + currentNumber
                        
                        getSetCurrentNumber = 0
                        _previousNumber = _total
                    }
//                }
                
            }
//                FIXME: why 1 - 0.5 = -0.5 ??
        case "-":
            // FIXME: enchainement clacul - voir chaque //
//            if isEnded {//
//                _currentNumber = _total //
//                _total = _currentNumber! - _previousNumber//
//            } else {
                if _firstStep {
                    calculFirstStep(currentNumber)
                } else {
                    if isDecimal {
                        print("is decimal")
                        
                        _total = _total - _previousNumber // !!
                        _previousNumber = _total
                        
                        getSetCurrentNumber = 0
                        isDecimal = false
                    } else {
                        print("is not decimal")
                        _total = _previousNumber - currentNumber
                        getSetCurrentNumber = 0
                        _previousNumber = _total
                    }
//                }
                
            }
//                _total = _previousNumber - currentNumber
//                getSetCurrentNumber = 0
//                _previousNumber = _total
//            }
        case "/":
            if _firstStep {
                calculFirstStep(currentNumber)
            } else {
                _total = _previousNumber / currentNumber
                getSetCurrentNumber = 0
                _previousNumber = _total
            }
        case "*":
            if _firstStep {
                calculFirstStep(currentNumber)
            } else {
                _total = _previousNumber * currentNumber
                getSetCurrentNumber = 0
                _previousNumber = _total
            }
        default:
            break
        }
        _firstStep = false
    }
    
}
