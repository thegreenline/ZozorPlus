//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    private let calcul = CalculManager() // instance of class CalculModel
    private var _displayNumber: String = ""
    private let manager = ViewControllerManager()
    
    // MARK: XCTest getter
    
    var getDisplayNumbers: String {
        return _displayNumber
    }

    // MARK: - Action
    
    var needToClear: Bool {
        // refactor check if operator is present at the end of calcul

        if calcul.getOperator == "" && calcul.isEnded {
            return true
        } else {
            return false
        }
    }
    
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        // spot number in clavier
        manager.isTapNumber = true
        manager.sender = sender
        
        
        if needToClear {
            calcul.clear()
        }
        calcul.isEnded = false
        _displayNumber = _displayNumber + String(sender.tag)
        calcul.addCurrentNumber(sender.tag)
        updateDisplay()

    }
    
    @IBAction func plus() {
        // action when plus btn is presed
        
        guard isCorrect, !calcul.isEnded else {
            if calcul.isEnded {
                // do take last result for new operation
                calcul.addOperator(signe: "+")
                _displayNumber = String(calcul.returnTotal) + "+"
                updateDisplay()
            }
            return
        }
        // do start new calcul
        
        calcul.addOperator(signe: "+")
        _displayNumber = _displayNumber + "+"
        calcul.updateResult()
        updateDisplay()
    }
    
    @IBAction func minus() {
        // action when minus btn is presed

        guard isCorrect, !calcul.isEnded else {
            if calcul.isEnded {
                // do take last result for new operation
                calcul.addOperator(signe: "-")
                _displayNumber = String(calcul.returnTotal) + "-"
                updateDisplay()
            }
            return
        }
        // do start new calcul
        
        calcul.addOperator(signe: "-")
        _displayNumber = _displayNumber + "-"
        calcul.updateResult()
        updateDisplay()
    }
    
    @IBAction func Multiply() {
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

        calcul.addOperator(signe: "*")
        _displayNumber = _displayNumber + "x"
        calcul.updateResult()
        updateDisplay()
    }
    
    @IBAction func divide() {
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

        calcul.addOperator(signe: "/")
        _displayNumber = _displayNumber + "/"
        calcul.updateResult()
        updateDisplay()
    }
    
    @IBAction func addComma() {
         calcul.isDecimal = true
        _displayNumber = _displayNumber + "."
        updateDisplay()
    }
    
    @IBAction func equal() {
        // action when equal btn is presed

        guard !calcul.isEnded else { return }
        calcul.isEnded = true
            displayTotal()
            _displayNumber.removeAll()
//            calcul.isEnded = true
        calcul.addOperator(signe: "")
    }
    
    @IBAction func AC() {
        // action when reset btn is presed
        
        calcul.clear()
        _displayNumber = "0"
        updateDisplay()
        _displayNumber.removeAll()
        calcul.isEnded = false
    }
    
    private var isCorrect: Bool {
        // check if all is ok
        
        if calcul.checkFirstStep {
            let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
            return false
        }
        else if _displayNumber == "" && calcul.isFirstStep {
            let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
            return false
        }
        else if calcul.checkIfDiviseWithZero {
            let alertVC = UIAlertController(title: "Zero !", message: "Impossible de diviser par 0 !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    private func displayTotal() {
        // display total on screen

        guard isCorrect else { return }
        let total = calcul.getTotal
        textView.text = textView.text + " = \(total)"
    }
    
    private func updateDisplay() {
        // update textView with new content
        
        var text: String
        text = "\(_displayNumber)"
        textView.text = text
    }
    
}

