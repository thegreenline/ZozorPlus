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
    
    // MARK: XCTest getter
    
    var getDisplayNumbers: String {
        return _displayNumber
    }

    // MARK: - Action
    
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        // spot number in clavier
        calcul.isEnded = false
        
        _displayNumber = _displayNumber + String(sender.tag)
        calcul.addCurrentNumber(sender.tag)
        print("Current number\(calcul.getCurrentNumber)")
        print("displed number \(_displayNumber)")
        updateDisplay()

    }
    
    @IBAction func plus() {
        guard isCorrect(), !calcul.isEnded else { return }
        calcul.addOperator(signe: "+")
        _displayNumber = _displayNumber + "+"
        calcul.updateResult()
        updateDisplay()
        print(calcul.returnTotal)
    }
    
    @IBAction func minus() {
        guard isCorrect(), !calcul.isEnded else { return }
        _displayNumber = _displayNumber + "-"
        calcul.addOperator(signe: "-")
        calcul.updateResult()
        updateDisplay()
    }
    
    @IBAction func Multiply() {
        guard isCorrect(), !calcul.isEnded else { return }
        calcul.addOperator(signe: "*")
        _displayNumber = _displayNumber + "x"
        calcul.updateResult()
        updateDisplay()
    }
    
    @IBAction func divide() {
        guard isCorrect(), !calcul.isEnded else { return }
        calcul.addOperator(signe: "/")
        _displayNumber = _displayNumber + "/"
        calcul.updateResult()
        updateDisplay()
    }
    
    @IBAction func equal() {
        // calcul
        guard !calcul.isEnded else { return }
            displayTotal()
            _displayNumber.removeAll()
            calcul.isEnded = true
    }
    
    @IBAction func AC() {
        // reset btn
        calcul.clear()
        _displayNumber = "0"
        updateDisplay()
        _displayNumber.removeAll()
        calcul.isEnded = false
    }
    
    private func isCorrect() -> Bool { // mettre toutes le verifs dans le controleur et renvoyer seulement un bool
        
        // check if all is ok
        if calcul.getOperator == "" && !calcul.firstStep {
            let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
            
        } else if _displayNumber == "" {
            let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
            return false
        }
        else if calcul.getOperator == "/" && calcul.getCurrentNumber == 0 {
            let alertVC = UIAlertController(title: "Zero !", message: "Impossible de diviser par 0 !", preferredStyle: .alert)
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

