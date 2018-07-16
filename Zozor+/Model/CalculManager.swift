//
//  CalculFile.swift
//  CountOnMe
//
//  Created by Nicolas on 26/06/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//
// FIXME: decrire ici a quoi sert la classe


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
    private var _decimalLong: Double = 1
    private var _noNumber = true
    // MARK: Getter
    
    var getPreviousNumber: Double {
        return _previousNumber
    }
    var getOperator: String {
        // return current operato
        return _operators
    }

    var returnTotal: Double {
        // only return total
        return _total
    }
    func updateResult() {
        // only calcul total
        calculateTotal()
    }
    var checkIfDiviseWithZero: Bool {
        // check if try to divise with 0
        
        var isZero = false
        if _operators == "/" && _currentNumber == 0 && _decimalLong == 1 {
            isZero = true
        }
        return isZero
    }
    
    var checkFirstStep: Bool {
        // check if is the first step of calcul
        
        var returnValue: Bool
        if _operators == "" && isFirstStep && _currentNumber == nil && _noNumber {
            returnValue = true
        } else {
            returnValue = false
        }
        return returnValue
    }
    
    
    // MARK: Setter
    var setTotla: Double {
        get {
            return _total
        } set {
            _total = newValue
        }
    }
    func addOperator(signe: String) {
        // set new operator
        _operators = signe
    }
    
    func restDecimalLong() {
        _decimalLong = 1
    }
    
    func addCurrentNumber(_ number: Int) {
        // verify and add a new nember
        if isFirstStep && !_addTenOrSo {
            if isDecimal {
                // FIXME: pb de decimal au debut
                if !_addTenOrSo {
                    _decimalLong = 10
                    _decimalNumber = _decimalNumber + Double(number) / _decimalLong
                    _addTenOrSo = true
                    return
                }
                else {
                    _decimalLong = _decimalLong * 10
                    _decimalNumber = _decimalNumber + Double(number) / _decimalLong
                }
            } else {
            _previousNumber = _previousNumber * 10 + Double(number)
            return // le pb vient de la
            }
        }
        
        if isDecimal {
            if !_addTenOrSo {
                _decimalLong = 10
                _decimalNumber = _decimalNumber + Double(number) / _decimalLong
                _addTenOrSo = true
            }
            else {
                _decimalLong = _decimalLong * 10
                _decimalNumber = _decimalNumber + Double(number) / _decimalLong
            }
            return
        }
        
        if !_addTenOrSo {
            _currentNumber = Double(number)
            _addTenOrSo = true
        } else {
            guard let currentNumber = _currentNumber else { return }
            _currentNumber = currentNumber * 10 + Double(number)
        }
    }
    
    // MARK: getter and setter

    var noNumber: Bool {
        get {
            return _noNumber
        } set {
            _noNumber = newValue
        }
    }
    
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
    
    var currentNumber: Double? {
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
    
    func trouveUnNom() {

        _isDecimal = false
        _total = _previousNumber + _decimalNumber
        currentNumber = _previousNumber + _decimalNumber
        _previousNumber = 0
        _decimalNumber = 0
        _decimalLong = 1
        _firstStep = false
    }
    
    func clear() {
        // reset
        _noNumber = true
        _operators = ""
        _previousNumber = 0
        _currentNumber = nil
        _total = 0
        _firstStep = true
        _addTenOrSo = false
        _calculEnded = false
        _isDecimal = false
        restDecimalLong()
    }
    
    private func calculateTotal() {
        // calcul result
        guard let currentNumber = _currentNumber else { return }
        
        let signe = _operators
        let realDecimal = currentNumber + _decimalNumber
        switch signe {
        case "+":
            _total = _previousNumber + realDecimal
        case "-":
            _total = _previousNumber - realDecimal
        case "/":
            _total = _previousNumber / realDecimal
        case "*":
            _total = _previousNumber * realDecimal
        default:
            break
        }
        _firstStep = false
        _previousNumber = _total
        _currentNumber = 0
        _decimalNumber = 0
    }
}
