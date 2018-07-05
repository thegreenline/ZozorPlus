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
     var _calculEnded = false
    var firstStep = true
    private var _currentNumber: Double = 0
    private var _previousNumber: Double = 0
    
    private var _total: Double = 0
    
    // MARK: Getter
    
    var isEnded: Bool {
        return _calculEnded
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
        firstStep = true
        _addTenOrSo = false
        _calculEnded = false
    }
    
    private func calculateTotal() {
        
        let signe = _operators
        switch signe {
        case "+":
            print("before addittion calcul \(_total)")
            _total = _previousNumber + _currentNumber
            print("after addittion calcul \(_total)")
            _currentNumber = 0
        case "-":
            print(firstStep)
            if firstStep {
                print("before FS soustraction calcul \(_total)")
                _total += _currentNumber
                _previousNumber += _currentNumber
                _currentNumber = 0
                print("after FS soustraction calcul \(_total)")
                firstStep = false
            } else {
                print("before soustraction calcul \(_total)")
                _total = _previousNumber - _currentNumber
                _currentNumber = 0
                print("after soustraction calcul \(_total)")
            }
        case "/":
            _total /= _currentNumber; _currentNumber = 0
        case "*":
            _total *= _currentNumber; _currentNumber = 0
        default:
            break
        }
//        _previousNumber = _total
        firstStep = false
    }
    
}
