//
//  CalculFile.swift
//  CountOnMe
//
//  Created by Nicolas on 26/06/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//
// ------------------------------------------------------------
// this file is the brain of the calculator, all operations, numbers, and calcul variables/ properties are here
// ------------------------------------------------------------

class CalculManager {
    // ------------------------------------------------------------
    // MARK: Proprety
    // ------------------------------------------------------------
    private var _addTenOrSo = false // check if is simple or compelx number
    private var _calculEnded = false // check if calcul is ended or not
    private var _firstStep = true // check if is the first step in the calcul or not
    private var _isDecimal = false // check if is a decimal number
    private var _noNumber = true // check if a number is present or not
    
    private var _operators = ""
    
    private var _currentNumber: Double?
    private var _previousNumber: Double = 0
    private var _decimalNumber: Double = 0
    private var _total: Double = 0
    private var _decimalLenth: Double = 1 // lenth of the decimal
    // ------------------------------------------------------------
    // MARK: Getter
    // ------------------------------------------------------------
    var getPreviousNumber: Double {
        // return previous number for instance objet
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
    // ------------------------------------------------------------
    // MARK: Setter
    // ------------------------------------------------------------
    func addOperator(withThis signe: String) {
        // set new operator
        _operators = signe
    }
    
    func restDecimalLong() {
        // methode to reset property of the decimal lenth
        _decimalLenth = 1
    }
    
    func addCurrentNumber(with thisNnumber: Int) {
        // verify and add a new nember
        if isFirstStep && !_addTenOrSo {
            addNumberIfFirstStepAndNotTenOrSo(with: thisNnumber)
            return
        } else if isDecimal {
            addNumberIfIsDecimal(with: thisNnumber)
            return
        } else { addNumberIfIsNotTenOrSon(with: thisNnumber) }
    }
    // ------------------------------------------------------------
    // MARK: getter and setter
    // ------------------------------------------------------------
    var noNumber: Bool {
        // get and set noNumber property
        get {
            return _noNumber
        } set {
            _noNumber = newValue
        }
    }
    
    var isTenOrSo: Bool {
        // get and set isTenOrSo property
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
        // return and update isDecimal value
        get {
            return _isDecimal
        } set {
            _isDecimal = newValue
        }
    }
    // ------------------------------------------------------------
    // MARK: public methode and computed property
    // ------------------------------------------------------------
    var checkIfDiviseWithZero: Bool {
        // check if try to divise with 0
        var isZero = false
        if _operators == "/" && _currentNumber == 0 && _decimalLenth == 1 {
            isZero = true
        }
        return isZero
    }
    
    var checkFirstStep: Bool {
        // check if is the first step of calcul
        var returnValue: Bool
        if _operators == "" && isFirstStep && _currentNumber == nil && noNumber {
            returnValue = true
        } else {
            returnValue = false
        }
        return returnValue
    }
    
    func calculDecimal() {
        // calcul decimals numbers
        _isDecimal = false
        if let currentNn = currentNumber {
            _currentNumber! = currentNn + _decimalNumber
            _decimalNumber = 0
            _total = currentNn + -_previousNumber
        } else {
            _total = _previousNumber + _decimalNumber
            currentNumber = _previousNumber + _decimalNumber
            _previousNumber = 0
            _decimalNumber = 0
            _decimalLenth = 1
            _firstStep = false
        }
    }
    
    func clear() {
        // reset calculManagers properties
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
    // ------------------------------------------------------------
    // MARK: private methode
    // ------------------------------------------------------------
    private func addNumberIfIsNotTenOrSon(with number: Int) {
        // methode for add number if is not tenOrSo
        if !_addTenOrSo {
            _currentNumber = Double(number)
            _addTenOrSo = true
        } else {
            if let currentNumber = _currentNumber {
                _currentNumber = currentNumber * 10 + Double(number) }
        }
    }
    
    private func addNumberIfIsDecimal(with number: Int) {
        // methode for add number if is decimal
        if !_addTenOrSo {
            _decimalLenth = 10
            _decimalNumber = _decimalNumber + Double(number) / _decimalLenth
            _addTenOrSo = true
        }
        else {
            _decimalLenth = _decimalLenth * 10
            _decimalNumber = _decimalNumber + Double(number) / _decimalLenth
        }
    }
    
    private func addNumberIfFirstStepAndNotTenOrSo(with number: Int) {
        // methode for add number if is first step and not tenOrSo
        if isDecimal {
            _decimalLenth = 10
            _decimalNumber = _decimalNumber + Double(number) / _decimalLenth
            _addTenOrSo = true
            return
        } else {
            _previousNumber = _previousNumber * 10 + Double(number)
        }
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
