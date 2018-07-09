//
//  CalculFile.swift
//  CountOnMe
//
//  Created by Nicolas on 26/06/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

class CalculManager {
    
    // MARK: Proprety
//    var checkZero = false
    private var _operators: String = "" // array of signes
    private var _addTenOrSo = false
    private var _calculEnded = false
    private var _firstStep = true
    private var _currentNumber: Double = 0
    private var _previousNumber: Double = 0
    
    private var _total: Double = 0
    
    // MARK: Getter
    var isFirstStep: Bool {
        get {
            return _firstStep
        } set {
            _firstStep = newValue
        }
    }
    
    var isEnded: Bool {
        get {
            return _calculEnded
        } set {
            _calculEnded = newValue
        }
    }
    
    var getOperator: String {
        return _operators
    }
    
    var getTotal: Double {
        calculateTotal()
        return _total
    }
    var returnTotal: Double {
        return _total
    }
    func updateResult() {
        calculateTotal()
    }

    var getCurrentNumber: Double {
        return _currentNumber
    }
    
    var checkFirstStet: Bool {
       return didStartNewCalc()
    }
    
    var checkIfDiviseWithZero: Bool {
        return canDiviseWithZero()
    }
    
    // MARK: Setter
    
    func addOperator(signe: String) {
        _operators = signe
    }
    
    func addCurrentNumber(_ number: Int) {
        if !_addTenOrSo {
            _currentNumber = Double(number)
            _addTenOrSo = true
        } else {
            _currentNumber = _currentNumber * 10 + Double(number)
        }
    }

    // MARK: Methode

    func clear() {
        _operators = ""
        _previousNumber = 0
        _currentNumber = 0
        _total = 0
        _firstStep = true
        _addTenOrSo = false
        _calculEnded = false
    }
    
    private func canDiviseWithZero() -> Bool {
        var isZero = false
        if _operators == "/" && _currentNumber == 0 {
            isZero = true
        }
        return isZero
    }
    
    private func didStartNewCalc() -> Bool {
        var returnValue: Bool
        if _operators == "" && isFirstStep && _currentNumber == 0 {
            returnValue = true
        } else {
            returnValue = false
        }
        return returnValue
    }
    
    private func calculateTotal() {
        let signe = _operators
        switch signe {
        case "+":
            if _firstStep {
                _total += _currentNumber
                _previousNumber += _currentNumber
                _currentNumber = 0
                _firstStep = false
            } else {
                _total = _previousNumber + _currentNumber
                _currentNumber = 0
            }
        case "-":
            print(_firstStep)
            if _firstStep {
                _total += _currentNumber
                _previousNumber += _currentNumber
                _currentNumber = 0
                _firstStep = false
            } else {
                _total = _previousNumber - _currentNumber
                _currentNumber = 0
            }
        case "/":
            if _firstStep {
                _total += _currentNumber
                _previousNumber += _currentNumber
                _currentNumber = 0
                _firstStep = false
            } else {
                _total = _previousNumber / _currentNumber
                _currentNumber = 0
            }
        case "*":
            if _firstStep {
                _total += _currentNumber
                _previousNumber += _currentNumber
                _currentNumber = 0
                _firstStep = false
            } else {
                _total = _previousNumber * _currentNumber
                _currentNumber = 0
            }
        default:
            break
        }
        _firstStep = false
    }
    
}
