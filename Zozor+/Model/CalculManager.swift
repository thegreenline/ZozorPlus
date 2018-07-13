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
    private var _decimalNumber: Double = 0
    private var _total: Double = 0
    private var _decimalLong: Double = 10
    
    // MARK: Getter
    
    var getPreviousNumber: Double {
        return _previousNumber
    }
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
    
    func restDecimalLong() {
        _decimalLong = 10
    }
    
    func addCurrentNumber(_ number: Int) {
        // verify and add a new nember
        // FIXME: pourquoi le calcul se fait mal avce un decimal autre chose que 0 ??
        if isFirstStep && !_addTenOrSo {
            _previousNumber = _previousNumber * 10 + Double(number)
            return
        }
        if isDecimal {
            // FIXME: modifier pour que le calcul des decimals autres que 0 focntionne correctement
            if !_addTenOrSo {
                _decimalNumber = _decimalNumber + Double(number) / _decimalLong
                _addTenOrSo = true
            } else {
                _decimalLong = _decimalLong * 10
//                _decimalNumber = _decimalNumber / 10 + Double(number) / 10
                _decimalNumber = _decimalNumber + Double(number) / _decimalLong
            }
            // ajouter une variable decimal number
            return
        }
        if !_addTenOrSo {
            // FIXME: |||||||||||| remettre _currentnumber partout ???
            getSetCurrentNumber = Double(number)
            _addTenOrSo = true
        } else {
            guard let currentNumber = _currentNumber else {
                return
            }
            getSetCurrentNumber = currentNumber * 10 + Double(number)
        }
    }
    
    // MARK: getter setter
    
    var isTenOrSo: Bool {
        get {
            return _addTenOrSo
        } set {
            _addTenOrSo = newValue
        }
    }
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
        _isDecimal = false
        _decimalLong = 10
    }
    
    private func canDiviseWithZero() -> Bool {
        // check if try to divise with 0
        
        var isZero = false
        if _operators == "/" && _currentNumber == 0 && isDecimal {
            isZero = true
        }
        return isZero
    }
    
    private func didStartNewCalc() -> Bool {
        // check if is the first step of calcul
        
        var returnValue: Bool
        if _operators == "" && isFirstStep && _currentNumber == nil && _previousNumber == 0 {
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
        case "+":
            if isFirstStep {
                calculFirstStep(currentNumber)
            } else {
                if isDecimal {
                    print("is decimal")
                    let decimal = currentNumber + _decimalNumber // FIXEME: renommer ici !!!
                    _total = _previousNumber + decimal // !!
                    _previousNumber = _total
                    getSetCurrentNumber = 0
                    _decimalNumber = 0
                    // FIXME: voir ici pour la finc du calcul \||\|\\\
                } else {
                    print("is not decimal")
                    let decimal = currentNumber + _decimalNumber
                    _total = _previousNumber + decimal
                    _previousNumber = _total
                    getSetCurrentNumber = 0
                    _decimalNumber = 0
                }
            }
        case "-":
            if isFirstStep {
                calculFirstStep(currentNumber)
            } else {
                if isDecimal {
                    print("is decimal")
                    let decimal = currentNumber + _decimalNumber
                    _total = _previousNumber - decimal
                    _previousNumber = _total
                    getSetCurrentNumber = 0
                    _decimalNumber = 0
                } else {
                    print("is not decimal")
                    let decimal = currentNumber + _decimalNumber
                    _total = _previousNumber - decimal
                    _previousNumber = _total
                    getSetCurrentNumber = 0
                    _decimalNumber = 0
                }
            }
        case "/":
// FIXME: mettrre a jour la verificatio nde la division par zero !!
            if isFirstStep {
                calculFirstStep(currentNumber)
            } else {
                if isDecimal {
                    print("is decimal")
                    let decimal = currentNumber + _decimalNumber
                    _total = _previousNumber / decimal
                    _previousNumber = _total
                    getSetCurrentNumber = 0
                    _decimalNumber = 0
                } else {
                    print("is not decimal")
                    let decimal = currentNumber + _decimalNumber
                    _total = _previousNumber / decimal
                    _previousNumber = _total
                    getSetCurrentNumber = 0
                    _decimalNumber = 0
                }
            }
        case "*":
            if isFirstStep {
                calculFirstStep(currentNumber)
            } else {
                if isDecimal {
                    print("is decimal")
                    let decimal = currentNumber + _decimalNumber
                    _total = _previousNumber * decimal
                    _previousNumber = _total
                    getSetCurrentNumber = 0
                    _decimalNumber = 0
                } else {
                    print("is not decimal")
                    let decimal = currentNumber + _decimalNumber
                    _total = _previousNumber * decimal
                    _previousNumber = _total
                    getSetCurrentNumber = 0
                    _decimalNumber = 0
                }
            }
        default:
            break
        }
        _firstStep = false
    }
    
}
