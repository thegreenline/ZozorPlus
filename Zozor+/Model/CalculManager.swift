//
//  CalculFile.swift
//  CountOnMe
//
//  Created by Nicolas on 26/06/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

class CalculManager {
    
    // MARK: Proprety
    
    private var _stringNumbers: [String] = [String()] // array of numbers
    private var _operators: String? // array of signes
    private var _currentNumber: Double?
    
    private var _total: Double = 0
    
    // MARK: Getter
    
    var getStringNumbers: [String] {
        return _stringNumbers
    }
    
    var getEnum: EnumeratedSequence<[String]> {
        return _stringNumbers.enumerated()
    }
    
    var getCount: Int {
        return _stringNumbers.count
    }
    
    var getOperator: String? {
        guard let returnOperator = _operators else {
            return nil
        }
        return returnOperator
    }
    
    var getTotal: Double {
        calculateTotal()
        return _total
    }

    var getCurrentNumber: Double? {
        guard let number = _currentNumber else {
            return nil
        }
        return number
    }
    
    // MARK: Setter
    
    func addOperator(signe: String?) {
        guard signe != nil else {
            return
        }
        _operators = signe
    }
    
    func setCurrentNumber(_ number: Int) {
        _currentNumber = Double(number)
    }
    
    // MARK: Methode

    func clear() {
        _stringNumbers = [String()]
        _operators = " "
        _total = 0
    }
    
    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = getStringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            _stringNumbers[getCount - 1] = stringNumberMutable
        }
    }
    
    private func calculateTotal() {
        if let number = _currentNumber {
                let signe = _operators
                switch signe {
                case "+": _total += number
                case "-": _total -= number
                case "/": _total /= number
                case "*": _total *= number
                default: return
                
            }
        }
    }
    
}
