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
    private let manager = ViewControllerManager() // instance of VCManager
    
    // MARK: - Action
    
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        // spot number in keyPad
//        manager.senderTag = sender.tag
        manager.keypadBtn(senderTag: sender.tag)
        updateDisplay()
    }
    
    @IBAction func plus() {
        // btn plus
        manager.plusBtn()
        updateDisplay()
    }
    
    @IBAction func minus() {
        // btn minus
        manager.minusBtn()
        updateDisplay()
    }
    
    @IBAction func Multiply() {
        // btn multiply
        manager.multiplyBtn()
        updateDisplay()
    }
    
    @IBAction func divide() {
        // btn divide
        manager.divideBtn()
        updateDisplay()
    }
    
    @IBAction func addComma() {
        // btn comma
         manager.addCommaBtn()
        updateDisplay()
    }
    
    @IBAction func equal() {
        // btn equal
        manager.equalBtn()
        updateDisplay()
    }
    
    @IBAction func AC() {
        // btn reset
        manager.acBtn()
        updateDisplay()
    }
    
    private func isCorrect() -> Bool {
        // check if all is ok
        guard let codeErreur = manager.getCodeErreur else {
            return true
        }
        var isCorrect: Bool
        if codeErreur == 1 {
            let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
            isCorrect = false
        } else if codeErreur == 2 {
            let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
            isCorrect = false
        } else if codeErreur == 3 {
            let alertVC = UIAlertController(title: "Zero !", message: "Impossible de diviser par 0 !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
            isCorrect = false
        } else {
            isCorrect = true
        }
        return isCorrect
    }
    
    private func updateDisplay() {
        // update textView with new content
        if isCorrect() {
        textView.text = manager.textView
        }
    }
    
}

