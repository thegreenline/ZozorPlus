//
//  CalculFile.swift
//  CountOnMe
//
//  Created by Nicolas on 26/06/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

class CalculModel {
    
    // MARK: Proprety
    
    private var _stringNumbers: [String] = [String()] // array of numbers
    private var _operators: [String] = ["+"] // array of signes

    private var _total = 0
    
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
    
    var getOperator: [String] {
        return _operators
    }
    
    var getTotal: Int {
        calculateTotal()
        return _total
    }
    
    // MARK: Setter
    
    func addStringNumbers(number: String) {
        _stringNumbers.append(number)
    }
    
    func addOperator(signe: String) {
        _operators.append(signe)
    }
    
    // MARK: Methode

    func clear() {
        _stringNumbers = [String()]
        _operators = ["+"]
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
        for(i, stringNumber) in getEnum {
            if let number = Int(stringNumber) {
                let signe = _operators[i]
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
    
}
