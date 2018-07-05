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
    
    let calcul = CalculManager() // instance of class CalculModel
     var _displayNumber: String = ""
    
    // MARK: - Action
    
    
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        // spot number in clavier
        if calcul.firstStep {
            calcul.firstStep = false
        }
        _displayNumber = _displayNumber + String(sender.tag)
        calcul.addCurrentNumber(sender.tag)
        print(calcul.getCurrentNumber)
        print(_displayNumber)
        updateDisplay()

    }
    
    @IBAction func plus() {
        guard isCorrect() else { return }
        calcul.addOperator(signe: "+")
        _displayNumber = _displayNumber + "+"
        calcul.updateResult()
        updateDisplay()
        print(calcul.returnTotal)
    }
    
    @IBAction func minus() {
        guard isCorrect() else { return }
        _displayNumber = _displayNumber + "-"
//        if _displayNumber == "" {
        calcul.addOperator(signe: "-")
        print(calcul.returnTotal)
        calcul.updateResult()
        print(calcul.returnTotal)
        updateDisplay()
//        }
//        calcul.addOperator(signe: "-")

    }
    
    @IBAction func Multiply() {
        guard isCorrect() else { return }
        calcul.addOperator(signe: "*")
        _displayNumber = _displayNumber + "x"
        calcul.updateResult()
        updateDisplay()
    }
    
    @IBAction func divide() {
        guard isCorrect() else { return }
        calcul.addOperator(signe: "/")
        _displayNumber = _displayNumber + "/"
        calcul.updateResult()
        updateDisplay()
    }
    
    @IBAction func equal() {
        // calcul
        displayTotal()
//        calcul._calculEnded = true
        _displayNumber.removeAll()
    }
    
    @IBAction func AC() {
        // reset btn
        calcul.clear()
        _displayNumber = "0"
        updateDisplay()
        _displayNumber.removeAll()
    }
    
    private func isCorrect() -> Bool {
        // check if all is ok
        if calcul.getOperator == "" {
//            let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
//            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//            self.present(alertVC, animated: true, completion: nil)
            
        } else if _displayNumber == "" {
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
        var text: String
        text = "\(_displayNumber)"
        textView.text = text
    }
    
}

