//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    let calcul = CalculModel() // instance of class CalculModel
    
    // MARK: - Action
    
    
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        // spot number in clavier 
        for (i, numberBtn) in numberButtons.enumerated() {
            if sender == numberBtn {
                calcul.addNewNumber(i) // add Int number
                updateDisplay()
            }
        }
    }
    
    @IBAction func plus() {
        guard isCorrect() else { return }
        calcul.addOperator(signe: "+")
        calcul.addStringNumbers(number: "")
        updateDisplay()
    }
    
    @IBAction func minus() {
        guard isCorrect() else { return }
        calcul.addOperator(signe: "-")
        calcul.addStringNumbers(number: "")
        updateDisplay()
    }
    
    @IBAction func Multiply() {
        guard isCorrect() else { return }
        calcul.addOperator(signe: "*")
        calcul.addStringNumbers(number: "")
        updateDisplay()
    }
    
    @IBAction func divide() {
        guard isCorrect() else { return }
        calcul.addOperator(signe: "/")
        calcul.addStringNumbers(number: "")
        updateDisplay()
    }
    
    @IBAction func equal() {
        // calcul
        calculateTotal()
    }
    
    @IBAction func AC() {
        // reset btn
        calcul.clear()
        textView.text = ""
        updateDisplay()
    }
    
    
    private func isCorrect() -> Bool {
        // check if all is ok
        if let stringNumber = calcul.getStringNumbers.last {
            if stringNumber.isEmpty {
                if calcul.getCount == 1 {
                    let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertVC, animated: true, completion: nil)
                } else {
                    let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertVC, animated: true, completion: nil)
                }
                return false
            }
        }
        return true
    }
    
    private func calculateTotal() {
        // calcul total
        guard isCorrect() else { return }
        let total = calcul.getTotal
        textView.text = textView.text + " = \(total)"
        calcul.clear()
    }
    
    private func updateDisplay() {
        // update textView
        var text = ""
        for (i, stringNumber) in calcul.getEnum {
            // Add operator
            if i > 0 {
                text += calcul.getOperator[i]
            }
            // Add number
            text += stringNumber
        }
        textView.text = text
    }
    
}

