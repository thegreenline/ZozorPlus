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
    
    let calcul = CalculManager() // instance of class CalculModel
    
    // MARK: - Action
    
    
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        // spot number in clavier
        print(sender.tag)
        calcul.setCurrentNumber(sender.tag)
                updateDisplay()
        
        
    }
    
    @IBAction func plus() {
        guard isCorrect() else { return }
        calcul.addOperator(signe: "+")
        updateDisplay()
    }
    
    @IBAction func minus() {
        guard isCorrect() else { return }
        calcul.addOperator(signe: "-")
        updateDisplay()
    }
    
    @IBAction func Multiply() {
        guard isCorrect() else { return }
        calcul.addOperator(signe: "*")
        updateDisplay()
    }
    
    @IBAction func divide() {
        guard isCorrect() else { return }
        calcul.addOperator(signe: "/")

        updateDisplay()
    }
    
    @IBAction func equal() {
        // calcul
        displayTotal()
    }
    
    @IBAction func AC() {
        // reset btn
        calcul.clear()
        textView.text = ""
        updateDisplay()
    }
    
    
    private func isCorrect() -> Bool {
        // check if all is ok
        if calcul.getOperator == " " {
            let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        } else if calcul.getCurrentNumber == nil {
            let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
            return false
        }
        
        return true
    }
    
    private func displayTotal() {
        // calcul total
        guard isCorrect() else { return }
        let total = calcul.getTotal
        textView.text = textView.text + " = \(total)"
        calcul.clear()
    }
    
    private func updateDisplay() {
        // update textView
        var text: String!
            // Add operator
        guard let currentOperator = calcul.getOperator else { textView.text = "nil"; return }
            text = "\(currentOperator)"
            // Add number
        guard let currentNumber = calcul.getCurrentNumber else { textView.text = "nil"; return }
        text = "\(currentNumber)"
        
        textView.text = text
    }
    
}

