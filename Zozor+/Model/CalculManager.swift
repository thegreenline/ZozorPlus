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
    
    private var _currentNumber = 0.0

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
//        _calculEnded = true
        return _total
    }
    
    func updateResult() {
        calculateTotal()
//        _calculEnded = false
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
        _total = 0
    }
    
    private func calculateTotal() {
        
        let signe = _operators
        switch signe {
        case "+": _total += _currentNumber; _currentNumber = 0
        case "-": _total -= _currentNumber
        case "/": _total /= _currentNumber
        case "*": _total *= _currentNumber
        default: return
            
            
        }
    }
    
}
